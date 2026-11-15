Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794722757;
	b=pJAl+Ll1tnK+oaf6SyDwnjB7RcTmIft0oU5QFZuus/M/sSt3msTvHB++UiI33J5rZpf/
	 CESOn6K8ukTh4gi3pvCcVzgwSRJ1aYzOHpuf//CzAX5HvzUYrjhoVUSJYNBcLhuj7LhC1
	 mggJsONHejb4B3Kj6/1BFkTzcMsBpYAXuNgsBFT2FQt5OV+w0mSgGNtKZSMrFyNc1nl2O
	 HVKXigGHcLNgZtNZ3ktKOO/hC15RJsHcnk/A+n0IvNQiRqgYW1QH08c+OJvwFhtSXvX1m
	 pvnWLK3rvtkBHzEcMGWrNOQi0uHAWPIYXxqc2a5TSyxQ9vQpENckKAcZ5pYdRCJsDFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794722757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
	b=svN90D04PyL9OWv8Skel6sGdBs6+vQpY/AdDrm4d0osWgoN1VC0NqWcUV/mZduLTAutf
	 wLfB5k0myPM5n79pfQYXXwZ1OJDQdSHR+h0sJZO/9nld2eQ1U5hZbw/iniEywhU15aX89
	 WTgnEeVDGPp0MwtL0/00CMo74JzaEzm535Ln2P5u7u5+ZHA0LQKZIgQMigxIM6Z2V0Kw/
	 Bb93UJ7KKM9dwKGPV2wmu71tYm08lvvD9bYf+EbmwkqULx8wdF74bC7XM/8eWu/tJNjyk
	 EEBSNYCRQiHNEhW4e9qrUmnBLMBQXRpdq7Kq2p630zFLgwdKvF9eeRNnv81c18e/Ycg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdM2pJet;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C71606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C71606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdM2pJet
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679aeeddc6bso2277664d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794722755; cv=none;
        d=google.com; s=arc-20260327;
        b=BOl6nUeHFuGU3r4mYDYuWzplNv2DktaWk32mqHcWIn/tnhttNcaW7Rd2dsPe0L9GVc
         8NEHs1wKNmagjBucMwosk6CRbj2GBGLYIZ34fO+w9u/PJGTeWnUMB1HPMShGic0Obx8A
         3kbxx/GNbJWv+2xAE6BBjysiFOkkEDhB1NbUEJ80gcwBjFrttnKiWvhaKVQg0seOYy3u
         O3mwvL1EY8kyIbSvfvT0ZY2W3iNp1hoauhKHszgCmhLHHXn+9qqhRnkURVpYWqZL2FZ+
         4HA/vsw3KCovPzf7exOENHMcvJ4ZSYh3J1TV3UripOfcx7CsPn/IQFwas+KUnlSQ+EsI
         AZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
        fh=eS4glJbScxrkuL+6mZRXDqrOFDx91GJD7KKr3asvAa0=;
        b=Dg9Kjcs5G3y345Sr4ufFGQxsF5cKMGILnCzh2cXEFHO/jXyvBH9lb6OiHRHLHmFKoe
         eSlkwZH/eQAq/PdG2rdluugMSvupcY6sa+yR99GkYY/rcb4eZ4NpvVRaDwyKSxW7hSKz
         x1/mMS7YJrn1/QUVtGprHFp+P817qMDPzkAflSgws0Pu80Peykyt+O/UA7QF7cKy/l7j
         NUmO4D4wkA6eUWe+QC32uB5A0dqXK30oX6SDrRp/QwvDiuNUERT8nwQKuvFyeuynE8zL
         KGUKeSqThM2EDvzoFFGd6rbtPp11h1JYJ9jEzVSAiSweZL7s8N1T7lw+eHkwi/29Irxj
         SoGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794722755; x=1795327555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
        b=hdM2pJetmcG7lbPfxmIHhMMbqalBSLiK1OfCAZJnDMlAl4hBUxie8rKwzuvG5ylXVi
         rBAcTxjUI4n8WNrDLkXJHncNqH1HEBjBGPWpnA7sLaJmEqz/yZ/lVzfUeQKl+DQ4yQ+d
         3+NBBaTn67q/aZcZKpnjRROVcoAxlvwMxcC5+GyVPq+DYS3Jpxqfz3jdrIMB9MG7FXKE
         XEGVOXSnuRR/ItZXUwkcXbbZnQH8SaNU+ns9GsPOVBUtp6nI4wzZJHAWtehYg0ot959n
         69RcXAJ4SkKHcrB2oQwRIuq2mAMMUPzQDsCxHCN0FZDTTAIO5ycMTxgQO/mozqN4ic2+
         c0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794722755; x=1795327555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
        b=VLtg9TMtn+ctRcHo+prMojhsEdn1ZRWpxDBXyvqLXfNTJ/ZW8P7mkWvzQvo3z7G0mp
         JaM6QlZlCiHXue/If0RQ3wAmpFSx79tcT27Rb+dmyeO4ecIUpmmqp8pVdmQ2V4NhLfot
         4xuEe+2/K7kGjaQUCgsOYx3UsddfjJYziZArarwlFUSN54epfmDZMyrRWkQDpZytiIHN
         +Zeq717QAi7WQG8ylr5oc474dd4lgNolupYD+kZvqpw7vZTk3RBqSJgbId3+uPQGzdVP
         Fn18U/x6zB3Wf9YEliTGXLoqFKG6O9kG1vNSMKv3g1zYe4JVM1bcgxlmDj/AwRlcGN3a
         XNxA==
X-Forwarded-Encrypted: i=1; AL+hErGhCrWGpm+IN8hZeLC9F4VDT/FhGkt3w8fqKJDv/KDpnlV3HbQrte1YxjCsgdnwasgQHyjqtsuQyPaGsag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7BXK9Kh9XO11jJToGbAY8OvD599Cljxa0XDHpyp3Rtca5LYPW
	3IYCJvaiZ2dauazsIOoNkU+3+DC/yoMgRYInf1DiSFDF5tVPR3SqnLJadhVuWxAkmEwSvEQzoUr
	1goJMHQYJNRA9C1IXAeHb0oCcwntkveQ=
X-Gm-Gg: AYBFou2NwpISFlmj2OzB3OCjhwjf8D0n4FJc6JxKG//JbqmNK06o4c7zZTJ4DSJPbQV
	WaJlDhsIHHtg+wz7+K09vfotVzPusl0EtTJW2AhIoxsKURHTv3W/cvKMLE7uqfVzvd8lOBWVPNF
	q/Ti2vC7qAUsEITPK9M9K4H9ISeDRsYp6sIxLcqgnWV5uSiMaCuBHtaz2u1BE5irEu2SEK8NPVB
	CC2W1d4ChFRqzW50v6wRNqcTTV07v0s+esii+qE5M61vxTz1+oqOHbAmPFfhingYeOCjAJItR7x
	NVDce8yIjNhIga9iGtgRi+zN9hieCN7qzlYvJgpieeeZOPSu7cCcvGo0xT9Xsw0emUfcd+BPlsf
	E5o/QCUN9o3377GQhCB1zCBvnmOJKebScueYFgOQXcrPYvgvQnyc9WUYXye5KCtzO7yO11NI84W
	ecfSQfA9gi84uXMzUq
X-Received: by 2002:a05:690e:803:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67d89661b52mr2334548d50.45.1794722755338; Sat, 14 Nov 2026
 22:05:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101194814.188536-1-asiyee994@gmail.com>
In-Reply-To: <20261101194814.188536-1-asiyee994@gmail.com>
From: =?UTF-8?B?QXNpeWUgU2FyxLF5xLFsZMSxeg==?= <asiyee994@gmail.com>
Date: Sun, 15 Nov 2026 09:05:44 +0300
X-Gm-Features: AclHuK9cK9SDzr5t64Hozu-2vcN3fjlBKrtXR2hNhcl8zQPeFczxV_7C3mWbcDk
Message-ID: <CAK77STANn3cS4-=mw59_G31_kFLyVp51N==K9RcikqrYzd4ELA@mail.gmail.com>
Subject: Re: [PATCH] selftests/ipc: Use IPC_STAT to get queue information
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

Just a gentle ping on this patch.

Thanks,
Muhammed

Muhammed Sariyildiz <asiyee994@gmail.com>, 1 Kas 2026 Paz, 22:48
tarihinde =C5=9Funu yazd=C4=B1:
>
> dump_queue() finds the message queue's stats by brute-forcing kernel
> indexes 0..255 with MSG_STAT and comparing the returned identifier with
> msgque->msq_id. This misses queues whose index is 256 or larger, and if
> no match is found the loop ends and the code goes on using a stale
> or uninitialized struct msqid_ds.
>
> The identifier is already known, so query it directly with IPC_STAT.
> This removes the loop and reports a failure if the queue cannot be
> queried.
>
> Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
> ---
>  tools/testing/selftests/ipc/msgque.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftes=
ts/ipc/msgque.c
> index 4b4c1ab..f4168c7 100644
> --- a/tools/testing/selftests/ipc/msgque.c
> +++ b/tools/testing/selftests/ipc/msgque.c
> @@ -130,21 +130,13 @@ err:
>  int dump_queue(struct msgque_data *msgque)
>  {
>         struct msqid_ds ds;
> -       int kern_id;
>         int i, ret;
>
> -       for (kern_id =3D 0; kern_id < 256; kern_id++) {
> -               ret =3D msgctl(kern_id, MSG_STAT, &ds);
> -               if (ret < 0) {
> -                       if (errno =3D=3D EINVAL)
> -                               continue;
> -                       ksft_test_result_fail("Failed to get stats for IP=
C queue with id %d\n",
> -                                       kern_id);
> -                       return -errno;
> -               }
> -
> -               if (ret =3D=3D msgque->msq_id)
> -                       break;
> +       ret =3D msgctl(msgque->msq_id, IPC_STAT, &ds);
> +       if (ret < 0) {
> +               ksft_test_result_fail("Failed to get stats for IPC queue =
with id %d\n",
> +                                     msgque->msq_id);
> +               return -errno;
>         }
>
>         msgque->messages =3D malloc(sizeof(struct msg1) * ds.msg_qnum);
> --
> 2.47.3
>
