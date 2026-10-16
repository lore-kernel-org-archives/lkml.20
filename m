Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8C53A16AE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131092; cv=none; b=ZGkj+tblOSIDM8GWYRWIMwbeLAVR07El0AjCAu3ed9B9ZemE/xcZVp1/WQ4LFhBVIZqoRGzm3oKZ1PqQD96iul506yMvGemGWb1FEFrs5A76lve+LQROVG4L4OdPY5W5TucAFoLQfFPex0oX5Im6ga4dj2dau/AfShDK+XNtJes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131092; c=relaxed/simple;
	bh=Tx3nO3gPySKjOpFH/Qz/c8UnQxOYcrJOu25+NL8Z3kY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVZdM9JHSRNq0OitSdlePwDduMU/VD8u4NSrnYbM9n2ve2qgXZZP+4hKgVxxIPK5pCwZ87KodmLe/k1iALAy6a9XzEqd7+L8vwarlO2ZV/Q9wNAAZBPPD8A/LAk/U4OLRrfhDjHBXVpPkIqZxwToAGv5FYOcpOafZWNETIrnsL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDqWd03M; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDqWd03M"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35ef6b49813so3496295eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131090; x=1792735890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kcslZZQo3mohhGw1TvUFqfaBbmuwHjcR/UsbiocVbwI=;
        b=XDqWd03MpPbUeAJQovOURZS8Jm6F9CcnYCNAWTwy8ht4d1Z1uF6jJ/Tw3etjGE0dLk
         uO6tBaZXjHw7G6SohCn6YLDqVZA2zyLd88TLgytTxLDCQrlikx09h3GjcscaaXo4r5hB
         D6knu/eRImVa+5gfbbspNWBk15jL0Gy1NrC/0+yYd7ZahWYgL7WM7uaMGEo5jN3mPove
         Tudt/JV4+MhxXaoFm6us0Y3HAMEobPaYvPDosN7C2+pXyr2EpOXVh5dG2BaEntrI+ebt
         Gn1E7HMlnksITYAsUYwkvQSgyYTzOdLKDqUtFmtlKNtHv5nccZNUTkmKM8VPc/axR/oe
         ZENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131090; x=1792735890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcslZZQo3mohhGw1TvUFqfaBbmuwHjcR/UsbiocVbwI=;
        b=rtK4xSIr2gZrI7+np690C7wtX247XgUJwxQEFxrUI9FTW+QZOoVYm+XYkHCKVjbuou
         o/JZWUA09B2+YTIsK4zwHRmItzprSfcANwf95JcshHLIoClJgGsymD0bbcTaBUV1oJgz
         k2MxaWbux3h5t2qg7oW3QK6XrJei2jG5QfQFx6I56XMalGWFfPjTNlkuG3urCxrhjblA
         8ZZyF6bVrEzPhBu/PBJxjh7MU5yr/D4JmshqLiv+AB4ngSeLyIs6J10zjcezSs1QM+mh
         XviKudtORYn5RnDv3yTgfpV0AUaeQYFnXw+4R1AIJUpe6RVZzaIMszdOk+IO5oRm9jii
         4qlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/veZzaFEK9z/7vWRbhruYqd5PNoga4UsZKZ5aOpBR6DzjZLl1rvoASjK5Zp6UG8+3ZVouEcFPL0UGiEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmIT066QrV/3zVEQZWdwV3/IoIPHT//keaDD/bVqlHAbvxsG2f
	R5aQb2lfyNzKjaLzHYRsYJpQNOLce0EU0xmdFUgLXiJoUKiKSCAeVQAP
X-Gm-Gg: AYBFou3hqocC5Gx4pu21BCmi9b1HQxdMmtuPSGXVY/VHnuHhXc3V1KxAlk0JoYCp7Oc
	mWEnbNLRIeJlE81owuXA0arVbvOi9WBE/NiQNZ4D0T4c5lzcbTwFyhBSm126gkWUR7fVpJPEoFb
	k1vZB+k//rfU22SJen/sCllCyauREU6THWoxt2q1WtDnHq/V9GwVSFcvgm+wJWAZ9Db8DDgaKJI
	0Pgn+wfl326bm9QorLzKnCOuuV2vV92fPSq/Za1ugfNs38ifBxyXuigT5nGHb9eIH5XHmbCwnQ2
	9VjeK8Hc1prjMMKN01daL7gyfmpqAF+9S9rjl3LUWpQsFIITq0Lq2z+c/Unn4J6SM+CITLZPHNH
	yEkzZdzB+U+n85cQxps7MO4VQAWh9xFpylG4cjRub42R4/LDy90JWqdEciPNTd41wNGilcj5s9P
	eqYJGI6hynO+ApAQXAUhvXVuv+tCfcOLheLElWYlP6kxEndmc6ieS2qzktp42GVPinOSTUQupds
	VPgODpCbA9UFBYVQwnU9oH84648wpMgZmEGvhJACLHdqcXP+f9tJPEkSg==
X-Received: by 2002:a05:7022:7e08:b0:144:fa58:95d8 with SMTP id a92af1059eb24-16a61a6ebb0mr39541036c88.27.1792131089901;
        Thu, 15 Oct 2026 23:11:29 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm3725600eec.4.2026.10.15.23.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:11:29 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Max Staudt <max@enpas.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] can: publish tty->disc_data only after register_candev()
Date: Fri, 16 Oct 2026 14:11:18 +0800
Message-ID: <cover.1792118038.git.chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

slcan_open() and can327_ldisc_open() publish the private structure to the
tty layer through tty->disc_data and register the net_device afterwards.
If register_candev() fails, free_candev() releases the net_device and the
private area with it, while tty->disc_data still points at the freed
memory. register_candev() fails with -ENOMEM from register_netdevice()
when the device name node or the kobject cannot be allocated.

Both patches publish the pointer only after the device is registered, so
the error path has nothing to unwind.

The slcan side is a regression. From the driver's addition in 2010 until
the 2022 rewrite the error path cleared the pointer in err_free_chan;
commit cfcb4465e992 ("can: slcan: remove legacy infrastructure") folded
that label away and dropped the tty->disc_data = NULL with it. can327 was
written later against this tree and never had the cleanup.

The stale pointer is not observable today. tty_set_termios_ldisc() clears
tty->disc_data before .open() runs and again when a failed ldisc change
falls back, and the ldisc entry points are serialised against .open() by
tty_ldisc_ref() (async) and tty_ldisc_ref_wait() (syscall). The series
removes a trap for the next modification of these functions rather than
fixing a bug that can be hit now.

Both patches apply with git am to mkl/linux-can-next testing and build
without new warnings on x86_64 with CAN_SLCAN and CAN_CAN327 enabled;
checkpatch.pl --strict is clean. The success path was tested by attaching
N_SLCAN and N_CAN327 to a pty under QEMU: the ldisc opens, creates the
net_device and SIOCGIFNAME returns its name. The register_candev()
failure path cannot be forced from userspace and is only compile tested.

Assisted-by: LLM

Chaosheng Qu (2):
  can: slcan: publish tty->disc_data only after register_candev()
  can: can327: publish tty->disc_data only after register_candev()

 drivers/net/can/can327.c           | 3 ++-
 drivers/net/can/slcan/slcan-core.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0
