Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77150331A61
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513655; cv=none; b=ABOOzTMm3uqI8LntRS/1hnpxc3SWUcp+zBwxjj3Vi2n9qgV0Y2idUkh5ZLuILo4ughHo9DV6OmGQ1elO78N5tDZYkb1Si8IqPxBe4oo3heHN17vcNOAjidbOcdefjzjoh6uQvuEN6E71+MQP2hv4Jit1XvS1njPQJU0p8tDYJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513655; c=relaxed/simple;
	bh=t3YlafWr1SlDS/aVRT+Oh0oX9kedWLVnAi0UCAFiTB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A62y5vpabx4zKwbUdeWqfbVnmQHKTJPTDr9Sa8/QKclyqcmxvJAj7n6D6LLYZv2ynMso1q6VBJcf9gxV6F6hN/7dxv6wfy6CSWS/JB3o07JoaFnQma2MetaxUXBuIMgsoRVUtJi8dPyn2Li0IcLhxhNIa7RL6qNfZQVToenLS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l08jL6u/; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l08jL6u/"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3516c82e96cso4223199eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791513653; x=1792118453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys5AkoGHO+1zeYlBeqQfwpPRvZXflN1giC3pkuSBrsc=;
        b=l08jL6u/UB5CK6VAjEWts4uNebuxwgJIZX+0hbCBm+n0UHtfMgLxNFgMiZexmNpXSW
         oQrcVhvutIYSR3Ar1qV48y0NCWLQluCbyb5pvOWzeS18l93IgmI1rHFWqAv0FFO1fdCQ
         6Xp1xya7CBrE9KHx27FasPBHdys9Q874RnKc7gaMcxoHLrUFIIOZTn8CnvH6xAEt3pwx
         KYNqXSokCEDAs8mK8zV2a6HWDAF9WHmIpfC8L8k5SrZxV0ipFVbZPuzaQY00yzYvkat6
         v94i+3WaRAgG/yHNPI9YqFA68yGcjpvuKhJgOzhKKrFHnfo67s3l7FYJu47FpwgnCz53
         FGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513653; x=1792118453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ys5AkoGHO+1zeYlBeqQfwpPRvZXflN1giC3pkuSBrsc=;
        b=YM2BCAmqUFARu6Z+p8v+lvKxIQsJaseOKBDaDtPmzJeNdMSrJ4l//P/nV0VJ0t6XWF
         kL1Inc7O4sLliWDk7nQO+Cyoslu/XQUzfUnUHRCzq6uKERsYj5FlzL7DeSIkNjmzxeQt
         C8GAshjJBKTHYuQ0KaoW46lvBeDIqhiaunPdQrwupFLX8psZfu650ALcduub/JJvUySz
         1wnLJZ7OP2RjVqoewllpQwt9QUsFUTaIzypuvD4SIFSp0tT0IrNNlYWWhKFrHCfv301E
         KUhCXC9HgLtRWTtWxyN0TQCpYUVMV4Dv4AK5OEd5phRizLABPNmCnDdZTiFHlrrumDJV
         co6Q==
X-Forwarded-Encrypted: i=1; AKwUvByV2pLBDmQBdDwDk5h75qK7cDNldy4iy/mMdSd6sD7smCDN1st1DoLHBYAhGznKq6RZxnnUOVGzOrJap5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9MHJdnEgR/tVud5fwIRz0C2YsA/0ePu0Bpztuw9iXz2us/u1b
	xcTrKpYgp9yR5x0d8bqvfUqjxUHBhXtD6WoscphVjyUx2eb3TmIrwnuW5Dqg3azI
X-Gm-Gg: AYBFou1/PX1JdMZ8ewuxm4qfnovJBUR8hekHyiabTuoXM0bfW39E8RwelPDElBrMWNJ
	brL3hGfApH/8aIVUH0IaspSlKfmK2VO2klvpbvp6FY9GiNHphmHfTDVFhecneI84Dsg9/nGR3ZM
	n+oOT8KNbj3pSaDPpMV+GDcrZ9Da6zCY+ToikL0FDfRnIxWrEml7kEMVoTyqj5TNlP1YZeGfQ46
	TiBRum2DEpVP5QLrpcor18ZA58AB73jSooJTaDBZNwk7MSJ45Kk8JTvJFu96PNFo31mJyhoOTPM
	knrNgvUrvKfLRkaNGHYzXhhC0X+zNh4C/adhTCv861iYZvY8nJkD1LGUe00OArcsvQoJWFebgs6
	5xe60K6vPoqYw7ZnzHBjhaPJ/W2TRG/1O9nS+iSqjCObMs6hCIEQv47pnAh7tLKhgdhkgALOhxa
	zEjTiWCk9mNlgdSwcodsmUsFkemuCPNvA04xOrCk80jdoKUbVS6k7WtAnAvllLG3gefUesYpUzI
	pqc1/UF8mUMU5EZJ78=
X-Received: by 2002:a05:693c:415c:10b0:351:1133:8780 with SMTP id 5a478bee46e88-3537dfd18cfmr1128625eec.25.1791513653255;
        Thu, 08 Oct 2026 19:40:53 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm2228774eec.26.2026.10.08.19.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:40:52 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: helgaas@kernel.org
Cc: bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de
Subject: Re: [PATCH v2 0/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Thu,  8 Oct 2026 23:40:38 -0300
Message-ID: <20261009024038.14888-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008223411.GA935963@bhelgaas>
References: <20261008223411.GA935963@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Thanks for reviewing the series.

On Thu, Oct 08, 2026 at 05:34:11PM -0500, Bjorn Helgaas wrote:
> If it would be safe to apply patches 2 and 3 without patch 1, I could
> go ahead and do that.
>
> Patch 2 returns errors from pci_save_state() in more cases, but
> hcd_pci_suspend_noirq() doesn't check for errors anyway, so I think
> it's would be no worse off it we applied patch 2 without patch 1.

I tested that combination on the MacBookPro14,3: patch 2 as you suggest
in your other reply, patch 1 disabled, the Alpine Ridge quirk applied,
and nothing plugged into one of the two Thunderbolt controllers.  The
system resumed normally.  The only difference was this warning, once
per boot:

  xhci_hcd 0000:07:00.0: Unable to change power state from D0 to D3hot, device inaccessible
  xhci_hcd 0000:07:00.0: PCI PM: State of device not saved by hcd_pci_suspend_noirq+0x0/0x1c0
  WARNING: CPU: 2 PID: 4344 at drivers/pci/pci-driver.c:888 pci_pm_suspend_noirq+0x2f4/0x300

hcd_pci_suspend_noirq() goes on to pci_prepare_to_sleep(), which fails
on the inaccessible controller and leaves it marked D3cold, and
pci_pm_suspend_noirq() then warns.  With patch 1 there is no warning.

So 2 and 3 can go in first, with patch 1 following through your tree
with an ack from Alan or Greg, or through the USB tree.  Patch 1 builds
on its own and has no effect in practice until patch 2 is in.

I'll send a v3 with your changes to patch 2.

Francisco
