Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1B55D875
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994847; cv=none; b=RJ3Q/qCetoXfpnTR7SCmiNaeDjenOBagsXeLTb7uTyhms4wdgb4i/H6HOACq2DtDePcRE9iYA31qv/Ccq/3vXZ4Y9FYteyTS7+9vuImPYuqQxWJ922LblkzXe9vVvOi6DfK4H+Uh/WRuIUaBTzgQRYqSH7JwhIgOBzsjFq/J3hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994847; c=relaxed/simple;
	bh=KOpW9NL741Wqf6CDHthraNjLF873jIDlBdmDkXr6AkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdmPNVU+AFuqDk7etuvRyu+Gm8zAdbqM+T04wrSncytaLzdbGHLj+j4gxvlWWDBdNsSGOkRYEQBXiib91SxnMdOCIpJB246BOfkOP1C7irgeetTPCLcVLhXEN17KxOpciZ95940+57qJ1KNCLJuXCilcEhA9vkdCcao1fQw//p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRDDZ5dL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRDDZ5dL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-486e8faff03so1902957f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791994844; x=1792599644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjI1AUhEkeYaz5+gj/BBEQM/J50SQrXWS0m/4fb/0T0=;
        b=KRDDZ5dLvmQxVaWSv1xKVRejl6KzvnurMd7QKx5jrQMfTm1sHb+NW2H/JooVv7dMCk
         Pb2c9vwVkMr/qnYP9JaLq5XF1Tb27ltBNF20hbCk3qYvitN4ylM70f1TEqd0EWag1V9M
         FGUfSWa+kkvneTXncAGQfqaSVHhFDsrMQz3yeYC2ZTdMUfCi96lYMgjB0iXYA89xuwq3
         Gr3jh14dnflPLRoqu6oIRlPH+tHu/VWGTCgm+pKmAbYXMlo7KxMxwDuxu126gu9qnU4l
         +5uO41RXaYbb7UQrHaaNvyKPXvAZG8hTPxVPvz/tvP+7TqHdmywvyph0dfVTqbSjt6uy
         cMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994844; x=1792599644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjI1AUhEkeYaz5+gj/BBEQM/J50SQrXWS0m/4fb/0T0=;
        b=baQulzBXs/Yze1sNwKv3T2pITyYa8T0Gxp9ion34T9xLRyH6n8TsZTa9J1EPq/kvoh
         scEVw9BI7iEXdVoGpS6mRY466kbVGaqqX4XRF3yJ8i1SK4LBXsSpzp507T6RyJMJ+R3d
         GOjUgul6/IvxvnAfXYrZdy4q9Md2ndiy4BxCU4b/CGasVUmlFj2fXxPoQVnp760hGKff
         NNBxuSvlSgAg7P2qP4k/B2bNqWbi+pIZAppppHeNn8oN8bmdNI0rgjn4iwx/BdLShFBv
         AmiHQz+GKGji4LRUFfpbFsTyeydD3FwlM7ZRs7f7TvrDTYA88WDUcjoLj4E/0j5LEfPW
         4Qxg==
X-Forwarded-Encrypted: i=1; AKwUvBzaVW8Ek+fni5PGi07VxnNTeFj2x+TJYZ1YqNx8H3CTIOsLbbXMshdXkukF1Fx0ilFo2mzFN6VQdnR5teY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1oR/DiKi1K76oKwDBBoeo3DRImsuvYxpuHl0IXRQcJERJDtid
	ls6lrpvvs6mhbOMozijOrYgtnE6Gn7mMgWXTfOblzzjzBoQ9kA44ajqs
X-Gm-Gg: AYBFou0PC3wt9JtzlyqWZdEfZipUAL45kQF6NI1aLuhq/vOvK/y9m6zfH+7atO6TVLF
	IIJoYMyEtBdoTlTR+oc/q4rDxknGl3VvvRdEqOOJr+eivMQrsiXB1Z2rqrl6RD4eL5xQs+cGcHQ
	NK7Qsz3y7A+JzUVSVYjU5X2AMPZU0cXaweIrL4dmpZYLL0ayYgLnLFnTO1uyqU7ybOY6adtLNLa
	C9AGGBseYoUjdSYtfd0Ma7SFrC7VS+B3teCsp7n+L8A3tD2HdtCsHVLSdTfctc+v7YqUdrt4eFP
	T7l+82cXV4D/Fs3/1a6WulN1ORM9kBs5wweKFvgplNIDtjez3+KhYb/6oIN1t33ioBPuttMjQRL
	bzwScjgxuwuljlJ8KigjVH3ZTqpdqGOMCBMB65C/j2devzfmf/pfHsmrmqkGooswhIeVWn0Jzz8
	F0+Qj7BFhM2zAQE3oB8zZpsAlBGRFKfowMwtoZY/nIQuubUd0oliEzO6Tr30JTf+qCMOi7WRLNQ
	SMnKfE6kAo0cbzvpTJuKukTildOKaQs+uwk
X-Received: by 2002:adf:ed50:0:b0:48c:7caa:12cd with SMTP id ffacd0b85a97d-48dbaae379dmr21487148f8f.22.1791994843601;
        Wed, 14 Oct 2026 09:20:43 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm8545727f8f.29.2026.10.14.09.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:20:37 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Birk Skyum <birk.skyum@pm.me>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Reset the in-band sleep state on power off
Date: Wed, 14 Oct 2026 19:20:24 +0300
Message-ID: <20261014162025.3733-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <179163212446.46972.2306254853726299632@pm.me>
References: <179163212446.46972.2306254853726299632@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birk,

On Sat, 10 Oct 2026 11:35:26 +0000, Birk Skyum wrote:
> qca_power_off() cuts the power of the controller but leaves the host
> side of the in-band sleep (IBS) protocol as it was. tx_ibs_state and
> rx_ibs_state are initialised in qca_open() only, so a controller that
> qca_setup() powers on again meets whatever state the last session ended
> in.

I ran into the same bug from another side, on a OnePlus Pad 3 (SM8750,
WCN7880 on UART at 8 Mbaud with IBS), and came to the same fix in the
same place, so here is a second trigger and some test numbers.

The second trigger is HCI_IBS_TX_AWAKE rather than WAKING:
qca_hci_shutdown() deletes the IBS timers and then sends the
pre-shutdown command, which goes through qca_enqueue() and arms
tx_idle_timer again for 2 s. If the device is opened again within those
2 s, the host still believes the controller is awake and sends the
frames after the new setup without an HCI_IBS_WAKE_IND, while the
freshly booted controller starts asleep. The commands right after the
setup get through, the first one after the controller has gone to sleep
breaks the link:

  Bluetooth: hci0: Frame reassembly failed (-84)
  Bluetooth: hci0: Opcode 0x0c56 failed: -110
  Bluetooth: hci0: crash the soc to collect controller dump

It shows up with "btmgmt power off" followed by "power on" within 2 s,
and on every boot of a board without local-bd-address when user space
sets the address with MGMT Set Public Address right after registration
(the unconfigured controller is powered down after its setup and up
again well within the 2 s). The stale idle timer can also queue an
HCI_IBS_SLEEP_IND in the middle of the next setup, which is what
df1e5c51492f was about.

> +	/* A controller that loses power is asleep when it comes back. */
> +	timer_delete(&qca->wake_retrans_timer);
> +	timer_delete(&qca->tx_idle_timer);
> +	qca->tx_ibs_state = HCI_IBS_TX_ASLEEP;
> +	qca->rx_ibs_state = HCI_IBS_RX_ASLEEP;
>  	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);

I agree with what the Sashiko review pointed out [1]: without _sync a
timer callback that is already waiting for hci_ibs_lock still runs
after the unlock, and ws_awake_device/ws_awake_rx can queue a wake
indication after the reset. As both timer callbacks take hci_ibs_lock,
the _sync variants have to be called outside of it. This is what I
have been testing (on bluetooth-next):

	/* From this point we go into power off state. But serial port may
	 * still be open, stop queueing the IBS data.
	 */
	spin_lock_irqsave(&qca->hci_ibs_lock, flags);
	set_bit(QCA_IBS_DISABLED, &qca->flags);
	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);

	/* The controller loses the IBS state with its power and comes back
	 * with both sides asleep, as qca_open() assumes. Stop the IBS work and
	 * timers, drop what they queued and start over from there.
	 */
	cancel_work_sync(&qca->ws_awake_device);
	cancel_work_sync(&qca->ws_awake_rx);
	timer_delete_sync(&qca->wake_retrans_timer);
	timer_delete_sync(&qca->tx_idle_timer);

	spin_lock_irqsave(&qca->hci_ibs_lock, flags);
	qca_flush(hu);
	qca->tx_ibs_state = HCI_IBS_TX_ASLEEP;
	qca->rx_ibs_state = HCI_IBS_RX_ASLEEP;
	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);

All callers of qca_power_off() can sleep, and the work items do not
call it, so there is no wait cycle. The flush moves after the waits,
so it also drops what the work and the timers queued in the meantime.

Sashiko also suggested Fixes: and Cc: stable, with df1e5c51492f. I
would point Fixes: further back:

Fixes: 3e4be65eb82c ("Bluetooth: hci_qca: Add poweroff support during hci down for wcn3990")
Cc: stable@vger.kernel.org

3e4be65eb82c is where the IBS state started to outlive the power of the
controller; the AWAKE case exists since then, and df1e5c51492f made the
WAKING case permanent. Mentioning the AWAKE trigger in the commit
message would help too.

Test numbers, five quick power cycles each (power on within 2 s of the
power off, then a scan): 4 of 5 fail without the change, with commands
timing out ("Opcode 0x2042 failed: -110"), and 0 of 5 with the code
above. With it, user space also sets the address at boot without having
to wait for the 2 s first, and it is now in the kernel I use on this
tablet every day. I have not tried your v1 as posted; I expect it to
cover my case as well most of the time, but I have only tested the form
above.

Would you fold this into a v2? I am happy to test it on this board and
give my Tested-by there. If you would rather not, I can send it as a
separate patch with your Reported-by, whichever you and the
maintainers prefer.

Thanks,
Vladyslav

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179163212446.46972.2306254853726299632%40pm.me

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
