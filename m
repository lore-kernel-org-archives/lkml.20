Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623741;
	b=ByA/4+5JRdHzwe7timUHR+aFK7VCIvoDwXhl0/PdrV7+CKlhc/9WxfDprZ9zfsEXXCkZ
	 /dEogABq5jPHH4T7U4tTJo/ieFp2kYz7J+H7LMHgwgjnlI3YpsZuOKbM9x87eEEqzZhii
	 536iGaV7MM/ZCM3SAh+0Bq5TTifWfVQzJdj7TDHK/m8MUzi79yeoBWcxMUGQpcsiBs+86
	 jr91dcRSFDDpaRjLuNArSEdZlVSDwAGQa7Ks0j3O5x/UkeRG0Ed7RMUeOllofoHnx4Wtr
	 4LSN0K+FfScyYlChb32+mY8lBOSmNW/BiHIxk9+HlkLjPmNo8Vt7K2z9GjmNdxH9EQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6XnqB70rXSs+gjzhceVbINLoPc35zaUEJn/5DXHkxzA=;
	b=jXTvSpowRL2tKmG88+kPj+f3A4o9g7t+HAvbBwIX8HQQ5c/2Zgmio5CkDThMeXOhkoQ6
	 BJj3JX4tOdMLRsC7vYCHUk7mOmKkwuyrwCOjpIFY78XDtddnopu/RuxSUp9JNIP7Xwyn/
	 kBneQ4V3VXO1TncrlWsuWuFfku16HMxKIQ8xmUbwgJuKGtOtm5nF4o6lY2lg/kXTkC0Pb
	 mgZ0TLJmeZUfp1M0YID7HHnLjJFUjvcTt5wgLEcn5jWavBslFx5xHAts7/V20gPWkMrVn
	 AW5KBDY+tFbR4X23ho4WzwlclVOpGJCLd79DPtsftywU9YUqq9JZlLHaH3X7FV7/25g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yPFET6h3;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84F60A2634
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C84F60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yPFET6h3
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d1da913so2248755f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623740; x=1794228540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XnqB70rXSs+gjzhceVbINLoPc35zaUEJn/5DXHkxzA=;
        b=yPFET6h3ymIhzYfTSsZwQqIEDHtlUaPrM3o+jCOhKPl48hSOiJ/XlIS+P1rehHbLFW
         WI5x+rlX0Hy8b8kPIdv3MjwSWESjt5qkMuB5wv3uz/bL9T5K7it4lcUH06aN26njy55u
         YAvuS/ATk34QZBaUn24XtvGM7cfqakpfSBorVwZpuoNAwFQijIKJtMjB/1uHz0MfToir
         qits2/pTRwzSOVq0sw6Z6LFZXqL1PNqb3RQCN3H8v1f8hA1mrwzW9dqOAEn6f21h4QBe
         VNiUuC26oEx2fgJ2kTpg1UmyY0ETkda3+TMfO22n6EfzWos6bTry9AtLWKiSPgc/0h1C
         XZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623740; x=1794228540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XnqB70rXSs+gjzhceVbINLoPc35zaUEJn/5DXHkxzA=;
        b=hQ+tRZh2FWdQHwRxIaihzrm/2O05Xn9fNtvjv1PvaEGvIjnsI0hJLF0U+b1eY7z0xK
         mb5rwFMIiRKPSiGgyFS2bSSqzAvCndX/upVgA8cMeX+rwO78ClXgA2trAlmRcNhPddZY
         cgb0UZaBKxmnOPab1kwagSmkyQbHAVK48/9w9xFzclPzDYFMaNE9qaVukR1zr04TGr7R
         sAbKqwdj8ckfIFU3POCDlem2tAqqSbHr1jV0mX1wL06gVOw/0Gf9CZntOPY139KIQpF4
         cQcI+0rKWnIRxqm8tbeNFcNrGmenQjGGreR0ll+bJDQ79leSdoaoL2UKMzqlPielQ8jD
         Kz6g==
X-Forwarded-Encrypted: i=1; AKwUvBwA+f5w1n5b+561O5yVHQHBORvC+L/+dhNcnOMrJTKXxFlG4+nM8pbyhn5D7aVXE1FdB+dPG4C+cdMFd5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/+mdpj3mNAXDz68A06FvKWUdqXKSIP8Ef/xiJRi2WJJfIQM4S
	XIOxSGFj+G8oLKRQe13XaAfi9q8aM3U4W5XGPvxGo4KaUxffSV5+Igg=
X-Gm-Gg: AYBFou0rSGM930ZGPKVFFwOdWwIn0AIlrhSIXLgahtDwy9LDGgoGqaX1lHk7G3OpvS1
	cf/KwVkNLgd5ldNBDp8yMGZz6b6VmkcycOI1eJviMFxJ6oSqgvLfitMncgQrRPfBzJ+PCtMxSGl
	8Fl73g7U6zryFgSXmXYOy5CIjfrKxo7cRU09ro7WRWmeBQBFhSbHr31nkmcsfqAEE5gr1XhxQxp
	S4GQzzQ0fYNa9O3N7szuosxAWe+qQBvg9NrWY79Nvb+Xl82ogOwuvdWDK8pwGtXCFXsjuouqSKJ
	uiULqU3zvCfSjidLLGmRkoXLv74FNxttjNsS7tHsrhWKw76ILQ1I5Qtf8FcRv1mVkfoCAnsbwwu
	auU/Uod+MMRO+QUBReGASEUed+y6+Y/+uk/CRZvtdQFSpGMjG7ozSEUHkI+gdaI8OxXf6Eld5On
	GvnXrTKI/1Nda0rCEUg9lYzx/l85JvA4xTkaloRyRWhbgb+Oyo0CYVm7Hg0y2/h1tglzxB7l58V
	ZRhskOwE8bxXRKjjGtajVeXqBgQoB8UQ1by71Fn5aIAl1cUb/Nvk4uH/P0lafHfZfDtd07JCw==
X-Received: by 2002:a5d:5d0c:0:b0:48e:7833:2e56 with SMTP id ffacd0b85a97d-48e7833321dmr15104937f8f.23.1793623739325;
        Mon, 02 Nov 2026 04:48:59 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm18719736f8f.15.2026.11.02.04.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:48:58 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless 3/3] wifi: nxpwifi: validate command response size against buffer length
Date: Mon,  2 Nov 2026 12:48:54 +0000
Message-ID: <20261102124854.325979-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102124854.325979-1-tristmd@gmail.com>
References: <20261102124854.325979-1-tristmd@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

nxpwifi_process_cmdresp() reads the firmware-provided resp->size field
and passes it to individual command handlers that use it to determine
how much data to process, but never validates it against the actual
response buffer length. A firmware response with an inflated size
field causes subsequent handlers to read past the buffer.

Add a check early in command response processing that validates the
declared response size fits within the response skb.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/nxp/nxpwifi/cmdevt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cmdevt.c b/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
index fc1950a125b65..50aabf1a72b2e 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
@@ -722,6 +722,20 @@ int nxpwifi_process_cmdresp(struct nxpwifi_adapter *adapter)
 	orig_cmdresp_no = le16_to_cpu(resp->command);
 	cmdresp_no = (orig_cmdresp_no & HOST_CMD_ID_MASK);
 
+	if (le16_to_cpu(resp->size) > adapter->curr_cmd->resp_skb->len) {
+		nxpwifi_dbg(adapter, ERROR,
+			    "CMD_RESP: resp size %u exceeds buffer %u\n",
+			    le16_to_cpu(resp->size),
+			    adapter->curr_cmd->resp_skb->len);
+		if (adapter->curr_cmd->wait_q_enabled)
+			adapter->cmd_wait_q.status = -EINVAL;
+		nxpwifi_recycle_cmd_node(adapter, adapter->curr_cmd);
+		spin_lock_bh(&adapter->nxpwifi_cmd_lock);
+		adapter->curr_cmd = NULL;
+		spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
+		return -EINVAL;
+	}
+
 	if (adapter->curr_cmd->cmd_no != cmdresp_no) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "cmdresp error: cmd=0x%x cmd_resp=0x%x\n",
-- 
2.47.3

