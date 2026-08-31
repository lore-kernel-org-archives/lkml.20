Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B89E274FE3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788136730; cv=none; b=Az0kHoMpFf2i64uJtCm1HKutFVVHp6ltJImd6G2QrvPQe+yNeHVuFxGVCfiX9EIhCXR4uHvg5MjUvG77xClEour9dWEifM32lndRgImez6Q7wPzYjceQodK/1xDo/ICdrTkABc7YkOk4NeqZJeGMkenR3C45+6A3plW67UyKfwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788136730; c=relaxed/simple;
	bh=hnEqVIHrcpgJxktwQOydaZPVuwv+zAwNBIU8aRTwlKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOWoFqcQVaHh7X3TijMjOnEcNnq9JtOPX3nxSnPR/m+VodFOqy7Q9miA9VYkRMFuYvBcyRzeeyOBivFyGiNF3cR2z9SBALEREWgkTVcDBoDbrdQwhnnOLEoaFRGkDrrbY+F92Sv+qsTEPP8XvZ7AwqCXMHpPZZ/lLmZVeKxRr30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ImdVvLnm; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ImdVvLnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788136723;
	bh=sJVWEeKNQndEe3FO2AeKvbwOrYpa0e5bOIBMs4B2Bpg=;
	h=From:Subject:Date:Message-ID;
	b=ImdVvLnmBuLR+YEUnd7Nlrg1nW05wnb2ye6o/SB9wi8B4Li86reagyHkTyWWRxUl9
	 VYYFdincrPIyk3nHWkFVXz8u6h9iWzXpipbxRxTVs3zmn4yXHh7vb7yA3sm8puRrWu
	 TWDAzXwmY7qOjr2KjYy3UuPoItEIrZNToi3osLTY=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A94CD08000053B7; Mon, 31 Aug 2026 08:38:33 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 4797804456993
X-SMAIL-UIID: A51647B6DC96479B96DF483E5D60F5ED-20260831-083833-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in keyspan_close
Date: Mon, 31 Aug 2026 08:38:32 +0800
Message-ID: <20260831003832.330549-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a944641.4d659fcc.734b4.003c.GAE@google.com>
References: <6a944641.4d659fcc.734b4.003c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 08dbfad3f504

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 17edc057a311..0464dbab17c1 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -301,10 +301,19 @@ static void serial_port_shutdown(struct tty_port *tport)
 	struct usb_serial_port *port =
 		container_of(tport, struct usb_serial_port, port);
 	struct usb_serial_driver *drv = port->serial->type;
+	struct usb_serial *serial = port->serial;
+
+	mutex_lock(&serial->disc_mutex);
+	if (serial->disconnected) {
+		mutex_unlock(&serial->disc_mutex);
+		goto out;
+	}
 
 	if (drv->close)
 		drv->close(port);
 
+	mutex_unlock(&serial->disc_mutex);
+out:
 	usb_autopm_put_interface(port->serial->interface);
 }
 
