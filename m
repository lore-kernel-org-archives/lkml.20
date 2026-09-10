Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB46582BBC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065872; cv=pass; b=ChI9EV73CVecgyXzQ8usWHIzd7lg0PHrzI7howt2kfq+sVpCrW2y7biSCLR14bzWoFu4H7jHa9O2XdhZBx+xaf8ej5jEpKQ8hp9qQ7h+yKAxrlEGymXCnMmvV+q07mVvuS/mYUmj4JOJ7jDY8CI5xywaBTCYhak1WFCVHUZf4dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065872; c=relaxed/simple;
	bh=xFtYMESwkraSasJbw3YRh3uL1QWxpB6iuCe15TY2WxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFjXtYVXIKGdAdCAoKiB5JW6ScLyGfxpCOOT/DFZeykmOK5uFYIxG0r1ESJgQFX4KA61AaJKlW29gvFx32vTFv6xxadV/f/bPRR1krgHIE6X6c5jrMQcYtObuVZHryqwhcdcR68xCkZnX8tykUt5P6eHhDGEnV9Pw5QLRKnMtb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/cCd1ME; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/cCd1ME"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2544ff970dso16873066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789065868; cv=none;
        d=google.com; s=arc-20260327;
        b=ae63zfXXhlK4xNemgNGuNoMQ5DcXj5YqdnjlThoEwQsZgPvLqlbwMD/PqS4ynFBbJX
         MWYXLFUIvn6L3ji/lMrdd5bKeBLoN5k288fls/DKQwELxIicF8J5SYSGVpZnHjcpF2yN
         JBgA4p1ygLoqDocetfBRoqP4CbHjPsWY17XAA2+VcCP34U9Je7QhriQbG2iW6oTRDOKa
         3nrQrPLA6sKT+6ljFUp9rt28HoBO7ufdk5brpfTeZh2mu/ACz8kyAKiUIoRJ9Sw15eqM
         7NG6kytAuDWFTsp2/QDv0qMtW2W0dmKekt6yCujto7bR7ioUZ45V0rcngGrLXGjxccl/
         ULKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K13jkmR1aE3pdZ04hI2AFyUuzFQUQagwS5oXYalfh0c=;
        fh=qyLnofkjStILwSt7fDFiK+x5IhXPrUHoDl9FvXHTBi4=;
        b=sh63YLZIR6vIKn7p23jWSHZTr303Ep9wuuYcnVUJ/KoBTJu/5DJNQackJO3Fa2Wc8S
         MQNQSlzaIb6TVjI16SO/2+ITpKeqBDDr/iF355rx+Sfhe2jUKiCMIVsxj6FxLI+Mc591
         P8fhfj0Ak1YMOr395fE46pZzebd1Bbc+AN1VRcxsGJwqksE7Fr9ZxlWwgT1Ay8C857lV
         gX3dyfBAHgU+EWjkwAX1poU3yNvN62/4OBTP1IhL39rHaaoyjIdJz1NiqK3+3+ugTsnZ
         PTCd+A0wNP97v/5p9yq6PYldLbvAPp9avT8TEr1Ju0qvbsmCxbs731JaGi1pMvylU0bQ
         X5nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065868; x=1789670668; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K13jkmR1aE3pdZ04hI2AFyUuzFQUQagwS5oXYalfh0c=;
        b=T/cCd1ME5NRXUGCBKdhX8bwRvsKABSLaTnAvx0z9CFBEhvHNcQy/Y3q2iGev3CNK+t
         qbrEy/accuaxO/ff0ksc3CeoVO/fN/1ai0AbsJ9Y0omNOKEpklmV1IRUONhwbvh+xGgd
         N+Pe7hDn+ewJSVccPtNDSQ2dfUC5Qa4JZXH+W7A9I2l0jPpHYxsgr88txFArfRHcZ6u1
         6ETWIVj31YH6BCAezYFkwEQMetuCRZcdAfx8+6Rmrl/Mf3QstDZJTJM4oV7f8Y9eJI8A
         29MzGUmLQae23xNYFTSkp25x42Tdfgcaeb6nImYmyknzfXshODliXYoMYbqwPtYIIpsN
         /AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065868; x=1789670668;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K13jkmR1aE3pdZ04hI2AFyUuzFQUQagwS5oXYalfh0c=;
        b=iSwkWkm95fZpmQpUhkKAMuMcJf1nDU3DRb8JX5mquFJ8iE1IvCPfRfzYGNyp2Q71iB
         Gs90QABYBN5oaDrj5JNsRKAIhD0kjPCc+xD+EAi2XL1cm8WHOIRnAC9/EXqowq4/s5xb
         WcYNbKKbGIsrUthRBOBCfLB22tk132qpsoMhd4LK/fF35aznuukGYFSf/divkYPc0++8
         /1mrcTzp8tk1qGgmPsf6vAhbDynMaXkt4aTn1qFYwrGA3TjsvncBm6eSAtL3JdVLhvee
         CAlJCSAtcrr0/XAQ2zlExFzzuA2t7HhvfP2rDeRQQsgrUYNSgLzLqYgU+ffR8Rs1Ck2+
         aNEA==
X-Forwarded-Encrypted: i=1; AKwUvBzVRuA7rISAjB1cWPSoe8IT7KOOcAwWcr+X9FhEUHo04L1ACRXYOT3xwF2uR4+N+lZ2nZuYVBQ0QvE0bo4=@vger.kernel.org
X-Gm-Message-State: AFuF++k4eX5yL6rd8tTzjz9mgJcoXvmJRQ5YKuxzyEWZ1p3POH6RSRaW
	FMK8YokvbB/aaIwrZl4SoLU2itNwUa/SvUTmpVKDgPqsae7/KolrwHvkzById0hwOHE9mikuu4n
	1A8PMK2/7XXEhnA1JBscZGSy8F6AOaBxnTcHlwt4=
X-Gm-Gg: AYBFou0yO9/lOTQPQvYHkbXkhiRoFZ90MWvJoCHDf3W24pj+SGlP9BpzZ2uEG2CUc9V
	mrpT0dkHTyTxTXg1DqnQ3s7lj3mLIzBoakskIwHjl0MyE8S2GKb/+NyuzgFhrqjr5V9kNvyVgTm
	KKPvRaKvHH8j+mlqxmiOHfnBuNjjxwJtD2nXOMtaiwoqUtB+m1kfC3gowVJHBsAhtpYQW7zE/Qz
	rs/cENJfS8MrYdLbs3oTvfcb8ocO83dD0YdYiynO+oncJHrbU4KqMPABlvCtL/KqwvNBvmDxdKa
	cm4fsxwy9n6uDSnGIQgx7EwXINeAPPdgilUUviFHYj6DMm3zuj5VnA==
X-Received: by 2002:a17:906:628b:b0:c29:3d59:706b with SMTP id
 a640c23a62f3a-c293d5974b6mr435596166b.44.1789065868035; Thu, 10 Sep 2026
 11:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627153532.547719-1-paritosh.potukuchi@amd.com>
In-Reply-To: <20260627153532.547719-1-paritosh.potukuchi@amd.com>
From: Paritosh Potukuchi <paritoshpotukuchi@gmail.com>
Date: Fri, 11 Sep 2026 00:14:16 +0530
X-Gm-Features: AcwNN1Wf20eBeoeYCCCCW1ZvWgiNTZDi866Qnqt9Ke_fVgbm7NEAcsBqFh4rYTM
Message-ID: <CAMfiSebZWbARrZR+CWeTMgo7-LMaCpqxrt_yWfFQVGFLofQ1ig@mail.gmail.com>
Subject: Re: [PATCH] i2c: amd: fix SMBus block header and PEC handling in the
 RX path
To: andi.shyti@kernel.org, shyam-sundar.s-k@amd.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paritosh Potukuchi <paritosh.potukuchi@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andi and Shyam,

Friendly ping on this patch.

Could you please let me know if there are any comments or concerns?

Thanks,
Paritosh


On Sat, 27 Jun 2026 at 21:05, Paritosh Potukuchi
<paritoshpotukuchi@gmail.com> wrote:
>
> Strip SMBus block header bytes from the received buffer before
> forwarding the payload to the upper layers.
>
> Handles the optional PEC Byte at the end of the received
> payload.
>
> Signed-off-by: Paritosh Potukuchi <paritosh.potukuchi@amd.com>
> ---
>  drivers/i2c/busses/i2c-amd-asf-plat.c | 34 +++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
> index e1699da838c2..daf318ce3bbb 100644
> --- a/drivers/i2c/busses/i2c-amd-asf-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
> @@ -46,6 +46,8 @@
>  #define ASF_BLOCK_MAX_BYTES    72
>  #define ASF_ERROR_STATUS       GENMASK(3, 1)
>
> +#define SMBUS_BLOCK_HEADER_SIZE 2
> +
>  struct amd_asf_dev {
>         struct i2c_adapter adap;
>         void __iomem *eoi_base;
> @@ -61,7 +63,7 @@ static void amd_asf_process_target(struct work_struct *work)
>         unsigned short piix4_smba = dev->port_addr->start;
>         u8 data[ASF_BLOCK_MAX_BYTES];
>         u8 bank, reg, cmd;
> -       u8 len = 0, idx, val;
> +       u8 len = 0, idx, val, offset, data_len, payload_len, has_pec;
>
>         /* Read target status register */
>         reg = inb_p(ASFSLVSTA);
> @@ -110,12 +112,40 @@ static void amd_asf_process_target(struct work_struct *work)
>         if (cmd & BIT(0))
>                 return;
>
> +
> +       /*Below is the SMBus block header received on the wire:
> +        *     Command       --  1 Byte
> +        *     Data Length   --  1 Byte (number of data bytes)
> +        *     Data          --  N Bytes
> +        *     PEC           --  optional, 1 Byte
> +        *
> +        *     PEC, if present, is the final byte of the transfer
> +        */
> +
> +       offset = SMBUS_BLOCK_HEADER_SIZE;
> +       if (len < offset)
> +               return;
> +
> +       payload_len = data[1];
> +
> +       if (payload_len > len - offset)
> +               return;
> +
> +       if (len == offset + payload_len + 1)
> +               has_pec = 1;
> +       else if (len == offset + payload_len)
> +               has_pec = 0;
> +       else
> +               return;
> +
> +       data_len = len - has_pec;
> +
>         /*
>          * Although i2c_slave_event() returns an appropriate error code, we
>          * don't check it here because we're operating in the workqueue context.
>          */
>         i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);
> -       for (idx = 0; idx < len; idx++) {
> +       for (idx = offset; idx < data_len; idx++) {
>                 val = data[idx];
>                 i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
>         }
> --
> 2.43.0
>
