Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D7128C5B1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788133851; cv=none; b=Bc0Qajukc9tH1/l8Ymk8cgQiQxN+FX6F7v/keODHq9KN4KmE58saDz8uQ3cXswGP+uxTJUNm3iAeS9gkT8xem122RDjLgerXt4JPbCo4pYE9RXsx+OVDWGGnjVrOaqzJlk5MnQNZElCJ379oiPB4QttNmYIJAJuy7B30cDyuA1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788133851; c=relaxed/simple;
	bh=Y/uijqeFAK3KcdEW4rTqHtFHIisCqZIvSD1NPB2NKDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1AYHu8spRUblefGEpK7dtA5PEvdz3YVSyVcIA9JLbj3Qqz4cDWrYEwrD3iDVf5XV+o7CYqMVNvcPXz8dIBuy8sCdLjz6Xkojnp/BkYIGdvqBu5QlBi/LyszTiYF2/rcLhtY8zMLJgMGegQYPhSifbmfQ7L/FCwBwAvbKpfl71g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ScDcsPYY; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ScDcsPYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788133844;
	bh=V80WwK7Ng2rZZaysFSCW5PP0+wI63klMloHRxjB6WB8=;
	h=From:Subject:Date:Message-ID;
	b=ScDcsPYYCYuwggsT8wce7UfufkaZiAm6IwFTDHzmGyWTc67U2yWf93YJ8yzI6XnZ4
	 1YCSbpz3KqYNoE7lVhVgEuMFfERM9UauaT2TT8iIrBjsfTL2WdAqVprBDhlE1NN8W7
	 XI01UmfgE5c+Zppg+ZoLxLJ+MT4KtVcTQMh2Jrbg=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6A94C1C700001E13; Sun, 31 Aug 2026 07:50:34 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5586056815899
X-SMAIL-UIID: 408513950753496AB46105B978EF9183-20260831-075034-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in keyspan_close
Date: Mon, 31 Aug 2026 07:50:31 +0800
Message-ID: <20260830235031.326993-1-eadavis@sina.com>
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
index 17edc057a311..51359815432a 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -301,11 +301,19 @@ static void serial_port_shutdown(struct tty_port *tport)
 	struct usb_serial_port *port =
 		container_of(tport, struct usb_serial_port, port);
 	struct usb_serial_driver *drv = port->serial->type;
+	struct usb_serial *serial = port->serial;
+
+	mutex_lock(&serial->disc_mutex);
+	if (serial->disconnected) {
+		mutex_unlock(&serial->disc_mutex);
+		return;
+	}
 
 	if (drv->close)
 		drv->close(port);
 
 	usb_autopm_put_interface(port->serial->interface);
+	mutex_unlock(&serial->disc_mutex);
 }
 
 static void serial_hangup(struct tty_struct *tty)
