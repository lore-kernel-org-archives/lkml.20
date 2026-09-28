Received: from mail-oi1-f226.google.com (mail-oi1-f226.google.com [209.85.167.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB874D9550
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604639; cv=none; b=pE7ZDi5IEZat9E4FVObJCzSNHxDAxlcYTDHQuDao6HUoUXo75VuAOvWyVXrYtgRmXmNAY/C66jRcsfP/bIcYBDqxZ31CkR4ZSDyfzHrJMdC+jR1Z3CP1x4eg1PZLqkx7NBbhw+WZBSSdsskrdybrdCco0qOoIxUanwelSEqbEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604639; c=relaxed/simple;
	bh=a++0rb7H/+TMOYAHedHBBwaigIlPOXftKgdj7vvKzdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A76vhGRmpluk5+Bjb5XqxdNpmfCskKDguCbwfZPNPk8UMmfgHdtgNmnhHGuDA54z7pINBRg1ObsANzMct4djHzjTm1qOpUoDyANI0r1i8D1NHpfx8PAr3HUneqrlbFDTLcgX0lwd5EMv/7TYDv1ENtwoBi8TEPH5A1klLw4/hus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PMHSjXWJ; arc=none smtp.client-ip=209.85.167.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PMHSjXWJ"
Received: by mail-oi1-f226.google.com with SMTP id 5614622812f47-4eb444ae5ceso303199b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604636; x=1791209436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FcxlbT/IPqEE+j+Dr+dq5M/vlgSXFWYWJnfkrK0O22U=;
        b=yFah0bhi14cAbKFU+LkmoQtoMVXmOxl1KAu9hIR4mWT2fYc89aPzfKZe8iD8CrRvve
         TqBrjEAD/gc7KtXEtF/QmtjAeh2IaPt3VwxjHqT0gQmkMCWXa00niHE3uDKdJB195FZB
         qcLeIZqVls0bfDZ1o4ilW+tUSZIrkgdyZa02Fzhub54CyU0dRAE6MA/jYD5RcMwnvGlH
         Izyhgov9mCDmL9Ip4e8b5I9rVSbfJczGK+PMUqw/xE+wLMI+jKXC3A3HFEaLQTl1K47j
         U/eNCBXzWimgTtX5jmAxYpgfJfCOpBk+3lN7TrQf7hQEmMQ522WjpaIGNpXNuIQgbg1c
         1gXg==
X-Forwarded-Encrypted: i=1; AKwUvBwGkVTw9mD54UqdAwFrW6p0S4qd09YvWIRk37YqorixU2q757X6/se6XGgB/IHHdJrrovNUh3tMb8EL7TQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ntrCkmIDMJhmjLibceo0e4Z7Ug/6dVIlipMyDti4SarvqqInKo
	zDvdUeyYCUWgLHT7+bIVbcWq/U4ANSKYscbf6NF0wbY4yh5xPPQH2pD1D/aNpnby8a0qkELI4rx
	8CN4gA4LquaN4jzKDhvE2rN9k8lwfBHsgO9iRFt/KDEhi9nAFZEB3UvabRL9CNVeBGJ0lXjx/Q+
	gJOjEyv2MXduMaYB/emIZRftstI+wbxtzR5puc62WRSTysOdmwC9KjwEneO9wFtR4W/+bPwMTUM
	PPHfHGOQSCEZg==
X-Gm-Gg: AYBFou1o3CtQ0QExscaawIabFeW2n0vI8TE4cZ+c2kO1elUE9iqsoVOmJ2IMrYUoktE
	eUqSLcYoBSzXw9ouc6oqGUdBUJU5HhA0opcer2cykPalaSSXaNYs9M4TumyJtZqq4Nq/Aumjbjv
	wFMhyugyvZZJBTiwENs2NpISoDV0YTuiPN1IubxGRou40IaZSwczV14/KPd5cHEje0EvTdntLAO
	pCJUQYJ9Oj8aiSglh4Wyc7mEltvI4H+8yNudgXDeUEwAtsOGuXJAY4veR5ROLf2ym2UaS92DuZC
	FsV3lBry3jNHfBE9g9NtfWVFs7b5EAP0BFtFVFQqPWZaqswbyWmFNKwHiOPAQbyBIj5ODBxw1Ft
	5o3PYdPJ0gqbOtzUOfEVguRPbjoXXk7Nm4XpvO3tYO5eWnQQxMupkA1v8tQd288a2M/RhpEYIde
	6HMxXnwFeOjKbGjLB0A5pPH5RhxIBQDRBX
X-Received: by 2002:a05:6808:2507:b0:4d6:92d4:c805 with SMTP id 5614622812f47-4d72bd435e0mr13623898b6e.61.1790604635783;
        Mon, 28 Sep 2026 07:10:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-493366b7a72sm1128371fac.14.2026.09.28.07.10.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:10:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so5867612eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790604634; x=1791209434; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcxlbT/IPqEE+j+Dr+dq5M/vlgSXFWYWJnfkrK0O22U=;
        b=PMHSjXWJKnANvYbXVrihNc+utMlm+rHA9Gz7PTYTYrz5aYKdLtw5HHvltvyWQzLsXj
         IuDtbK5JdUmLtX+JNcx8lZ/XgKcN5TeWjtoH9KnmmYNcl4Rqe5iHuLV93XIQPHDCK3Eq
         fEi2b2KY0l5xS6PIiierCw4vBgSUg/blAiDFc=
X-Forwarded-Encrypted: i=1; AKwUvBy7F+TuaOOVON4gBJ5TtT/LEvokPcY0iF5pnXTgjrEv4esqprvY9Q98PPn3LvFP9Ein/zQYv3Wvg9hZgJ4=@vger.kernel.org
X-Received: by 2002:a05:690e:4145:b0:673:ba58:a25e with SMTP id 956f58d0204a3-673ba58b73dmr5769571d50.51.1790604166644;
        Mon, 28 Sep 2026 07:02:46 -0700 (PDT)
X-Received: by 2002:a05:690e:4145:b0:673:ba58:a25e with SMTP id
 956f58d0204a3-673ba58b73dmr5769508d50.51.1790604166044; Mon, 28 Sep 2026
 07:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928134154.1595-1-getshell@seu.edu.cn>
In-Reply-To: <20260928134154.1595-1-getshell@seu.edu.cn>
From: Paul Ely <paul.ely@broadcom.com>
Date: Mon, 28 Sep 2026 10:02:34 -0400
X-Gm-Features: AclHuK_52ZSR44aN88C_wd0bRmeuDyPIxVHwHNA1jwwrsvZM2Id8qEDGI-I2i44
Message-ID: <CAEQnVQkr54mp_0ZdM4=teybN-VBPUBH5miGRnoeA7WDvV5VhuA@mail.gmail.com>
Subject: Re: [PATCH] scsi: lpfc: disable delayed CQ work before freeing a queue
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: James.Bottomley@hansenpartnership.com, mkp@kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jianhao.xu@seu.edu.cn, Nigel Kirkland <nigel.kirkland@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002d34fa065c8ba1e8"

--0000000000002d34fa065c8ba1e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Hongyan,

Interesting patch.  How did find this issue?  Testing?  If so, what
sort of test or was it code review/AI?

Thanks

Paul

On Mon, Sep 28, 2026 at 9:42=E2=80=AFAM Hongyan Xu <getshell@seu.edu.cn> wr=
ote:
>
> CQ processing can leave sched_irqwork or sched_spwork pending on a
> delayed work timer. Flushing the HBA workqueue does not wait for delayed
> work whose timer has not yet queued it, allowing lpfc_sli4_queue_free()
> to release the embedded work item and its queue first.
>
> Initialize both delayed works before allocation can fail, and disable
> them synchronously before freeing any queue resources.
>
> Fixes: 32517fc0975b ("scsi: lpfc: Rework EQ/CQ processing to address inte=
rrupt coalescing")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  drivers/scsi/lpfc/lpfc_sli.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
> index cfa4371169f1..0348442b979f 100644
> --- a/drivers/scsi/lpfc/lpfc_sli.c
> +++ b/drivers/scsi/lpfc/lpfc_sli.c
> @@ -15828,6 +15828,9 @@ lpfc_sli4_queue_free(struct lpfc_queue *queue)
>         if (!queue)
>                 return;
>
> +       disable_delayed_work_sync(&queue->sched_irqwork);
> +       disable_delayed_work_sync(&queue->sched_spwork);
> +
>         if (!list_empty(&queue->wq_list))
>                 list_del(&queue->wq_list);
>
> @@ -15892,6 +15895,8 @@ lpfc_sli4_queue_alloc(struct lpfc_hba *phba, uint=
32_t page_size,
>         INIT_LIST_HEAD(&queue->page_list);
>         INIT_LIST_HEAD(&queue->child_list);
>         INIT_LIST_HEAD(&queue->cpu_list);
> +       INIT_DELAYED_WORK(&queue->sched_irqwork, lpfc_sli4_dly_hba_proces=
s_cq);
> +       INIT_DELAYED_WORK(&queue->sched_spwork, lpfc_sli4_dly_sp_process_=
cq);
>
>         /* Set queue parameters now.  If the system cannot provide memory
>          * resources, the free routine needs to know what was allocated.
> @@ -15922,8 +15927,6 @@ lpfc_sli4_queue_alloc(struct lpfc_hba *phba, uint=
32_t page_size,
>         }
>         INIT_WORK(&queue->irqwork, lpfc_sli4_hba_process_cq);
>         INIT_WORK(&queue->spwork, lpfc_sli4_sp_process_cq);
> -       INIT_DELAYED_WORK(&queue->sched_irqwork, lpfc_sli4_dly_hba_proces=
s_cq);
> -       INIT_DELAYED_WORK(&queue->sched_spwork, lpfc_sli4_dly_sp_process_=
cq);
>
>         /* notify_interval will be set during q creation */
>
> --
> 2.50.1.windows.1
>

--0000000000002d34fa065c8ba1e8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
iId6lRoDnFAsEvnaOMvg29iSc9gZaFsMAV8NLrmVgatBLqETEHgQ4n1BrE2+pRoymE80Zf+Qe5W6
GF5zYMjxe2smznZoexz/BISo+5QDZaKZKtmoZ3ApyLjKz1G5Q2hUhmZWHvMu/eGSXP59UaUUmelW
ZlVs3E0h345YpaGuBNlquYm35nQ3ehYjm2jqaIh7F7K0+eF5TPjcMLpqnpak12xIx6BCxmFi8Oqu
Gb9+KrrAD+KPgqzjyZZxdVcCAwEAAaOCAdkwggHVMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8E
AjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxz
aWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDov
L29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EM
AQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIAYDVR0RBBkwF4EVcGF1bC5l
bHlAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroP
ry1QLdugI4UYsKCSMB0GA1UdDgQWBBTc34vK15RY7h33segpWeDeAloTGDANBgkqhkiG9w0BAQsF
AAOCAgEAb0hABkNonbsXXPrDOwB9B9lRtVhdRszakaT0zWubTTtHAV/XTebY1b4caUC2iX9AJvr0
XTJrFAiLtJ6eeP6yQOjD+rBprWauwPUzydJWEftECpX/lbPgZLBSHx22euCSnIm8HNj8o0bMi+Ii
plCW6kU56G1krQY0jrqDJCFgH4Wmp1TrKi36iVTIXyYLDtPOcSXe9hLmeUlQuL4nAoB8EsI45w4a
5Wi/xS7vGQLXzXAQ2SY6Yuseqhh+QcXvzeb0uVB54edC4HFrVX9DtFzHXoyB9s0C29MZm2zpFPNS
DgwnsmTsvpPuLELuuaJvIKnSHHR9FKrmQZbmz/i6KyBt0enmjNk7I7vAKQa8IqZxSrjvR6tYExiq
BP9ZuiXJnuqoPujFE7kphkUjmK76yv8904eZNflTvcEDpthD1boifOzT78iQ3fbuytR8LKx7tzGV
Ga9+dcLBcR/eP85Vmc9NW1frtO3dRd26+DHs1lXX96Em5AAlvBgDw8b1GfyEvfimBkxTIWxR3mBB
jAMkNKrfvV7NxS9AfcFu4fvxuBJc+t2FN1zBc8VyVyn9ZBeJ2DYS9uQ2x00QPXMHqVlAT5fBanmS
n1fgcSTdHEy1fzVZIAtM1XMIWy03bJKNBwUebgxHKHSUCZ7VSMHE4jyERMCqkvTxU6h4JJ7YzRrU
jhXYo8oxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgx9OiWw8dVRSIkn
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIIENdvSymo/k3rlxEaRQUNNcAmLW
9kaXsq+SqWLtmsOvMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MDkyODE0MTAzNFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAJw0788BSL/vXrjo4AM63vyhDSKpVww5jSHQZdfYcnlNK2tPx5dND7slstSK7mXs
ye3kp+Z2m2FS18i72Bof5K3YP9cgbcYbCU4kuC8mgpxKxEE5TaeZghxqLfy9quGvBZDaazWBmQx7
H2LRPWIa6Cni4Zd7vHX9rssnbMctv/KvrDk3m+UGlREqS7hH/dOAsAaTcl08GM8XhKEeEfMBp2zC
u6CVLUdlI7rwW976CPYnETuP9bki6gtcmVx8zwm/DPzLwZ5+6UYQDPH+DhU1O+32g5HsWscBD0tN
A/M1xff6Xs7L9z6/WV3mEy0JaE3I8yNk8jStZiMBfatcoDj4GZs=
--0000000000002d34fa065c8ba1e8--
