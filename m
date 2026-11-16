Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833575;
	b=B+OD8NAn4EphjqL1HW6xKXsRO6rknEuV5C/oS/nV7jShcvBoJTlUku3wKSt6YYQW+4Ua
	 iA6QbUwxYDyVJd6sd1/a6phbJU/19sCrpxNikFrnx3+H5agy7+5lqsQVkhLT6+BwWwZgr
	 kJ10cbplgRW6P+Bfc9wjZTKLVnbWd1mtnB9laAFaDuCI2SIlbk/bNGBtu11hWQO6XWH7u
	 pZsrsCyBNJVQ4S5QezHe2OdJ+YzNH+grfA1Tt0SCio0PAi/ULzlOeThlHgcYwAAKyl61e
	 gNE8BXiR50O2MumHx1sVqUMC/UAKhYz8iBKW7gyc15rveZ9yybG1F4iUBlDbyFS5xBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833575;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=b6veJGbizFYJh3+f/7L8wQfgrLbB+b+Z/eBUGMygkBk=;
	b=gw0NBJpw7NmTbHFWNwCRO2kXhR6zgEX9H7FkhnM66vyi2bQkb2oP76qoDY3Wqn01Pxda
	 mt3k6yO5OEpcE+b2UGvoTy+jLOgzmP0MFZLQzgF7Zv5WJ+5qqCTeBcCDv1fluufOPnO+N
	 3pVUrxnWUxxHd4235Gu931Ht2Gq1GJcvLahvQG7lPMgrT39bAywMc7VegezWGq6b7caJY
	 LuLRkAnmd1Vy0YqALTCUWU9ZuD+5nHUAn9dgxH2Z428BRieQbbQ/gzcTGoHyjDKJUGRrC
	 JwQzFJTZgIM150fbeZSMrbUzcdRfHSdizHFS6Dkup/GUpkx3d14FIDhzd5EUsAvxX0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SAVZ4huf;
	arc=none smtp.remote-ip=74.125.82.97
Received: from mail-dl1-f97.google.com (mail-dl1-f97.google.com [74.125.82.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B15606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B15606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SAVZ4huf
Received: by mail-dl1-f97.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1420640c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833574; x=1795438374;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6veJGbizFYJh3+f/7L8wQfgrLbB+b+Z/eBUGMygkBk=;
        b=eqiojUdAYUQwPhcqcBLU4rmb76l/wlXAzw7RKX9o7LldClg1D0SrpYOhzhwylohA0D
         PWgQGCXgu0vydDXMYRbOBYsql4oCfR04etHHPT/+uZ5/lDulMzNnroFSSYLldwmzilBH
         bTov4WCFll+DU0g0vDUizr7QXZMF8LVSrU6TImGkfAvTlxmg2oDuEqZTijAV4vPLLhfT
         2RpxZPKv5zrhv1JY1w/ei6aFCPwDPyB/DcWY5b5FhoQnNPBnpPuYPzxUdfR9d6CzzAg2
         AQ5v5s2gM1fQ1xAYS2qHBPQ+6SsRSsIZxuX1dncYGDnmj+yZ7OtUEi+7J2goAVFqw2Mi
         v9Yg==
X-Forwarded-Encrypted: i=1; AL+hErEAIS7vzcZ4PMWodVoLavvHVNlA3qJQPUHn3qbtFKOY/jvSkOFWNU/P+OXhIQNhupeFb1546hfZKfi/qzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I4yCqhMZUTsVXGv7mY+HtDE3kERUTkZwotKqd5GcNa7crhJQy
	CSksTWLCM8A1owUh/14sik60Uuk+gIS12LiNmFKcgey9i5rGJKK932p2GzteTSYQKNjbbAQd6Qo
	fnSuaGMo5OSaRL/ziDHMq4/uDxEh+Ecg1UoDA5XWU44pl2EGnkUpWNyBQ0EOKjcXQ5Kpc31+al6
	f867AiCxHEdfbEcmKvBIBA/dHBbLY0sr26f5FzxdCgfDyX/YD3GW18KnHqdhBP/qUH2sKV4T0GT
	xZfFm9vBDamkLNB+lbTRsnI
X-Gm-Gg: AYBFou0+lVXWMgOoPEhviL2r/K7dWAgXUbt547w8cO6+LGS6u/M1/AbRCPult5dL6g3
	gtTmTbUB6bQ8xO1R3DZ+x3+8e50taiQbo4l37THc/dcDuxG9RJhPLanz6XDCq/H6niDrDBMSHsW
	Q07b7yFLxkH0R7HFehAzDEvDlK9zanVVWR54tgAHHfQHSbc4hT3nxgGEJeVZUzbGKe5XDyCj879
	c1mrVGSr+Sx/lmfdi7ZbH2UAXoqGCvUgeuKbAq++jIreDlMhG6Z6Lp/pOKT65XOpuDSObKiilAO
	DNeHI8kGCtyziw9Ya5azuHaPTLzSoiLbaEMwed/A+Q4Z0ZI2dg33m+8fcIVFhLDZiL3IJqrTCrx
	wOT7572/LLDoF6ifRCid7EBDVf8kCX+vb6b+8SCFLaFrICpvbInvFHBz0mh2dW8nM+GzoLwz5PV
	gxLlcfXM7AYNEaRZR3dmsFlF4sY/5kz+yF6nEw+Q==
X-Received: by 2002:a05:7022:7f17:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b5030e9a9cmr11967514c88.10.1794833573535;
        Mon, 16 Nov 2026 04:52:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3795a48adffsm297582eec.20.2026.11.16.04.52.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:52:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so3580652b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794833572; x=1795438372; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6veJGbizFYJh3+f/7L8wQfgrLbB+b+Z/eBUGMygkBk=;
        b=SAVZ4hufu8zcFR6gLR/w4d9FjJuhUuHS/MyWx0Wo3CdxW5Tj0vbue1pIBaSP8Zl0zn
         sYa6yJUc3ZwWF8jHp5R7loScbbUqlRJd2wQyGoppNnjby4pRlH0PIek1TprOG6HB2cFy
         dhcDPAdwFVRF6khvlXnEVW/PkhzDkqH0nO0es=
X-Forwarded-Encrypted: i=1; AL+hErEGROYGjE+qF/3ktN7kgfFgyZB6yjmMzgJzxmdQjzpT1d3iEi0CmMCAwdYRRwqxbrJXIt+wLx46FeORl9I=@vger.kernel.org
X-Received: by 2002:a05:6a00:94e2:b0:886:458a:42e9 with SMTP id d2e1a72fcca58-8beb7a215b4mr8976129b3a.49.1794833571738;
        Mon, 16 Nov 2026 04:52:51 -0800 (PST)
X-Received: by 2002:a05:6a00:94e2:b0:886:458a:42e9 with SMTP id
 d2e1a72fcca58-8beb7a215b4mr8976113b3a.49.1794833571334; Mon, 16 Nov 2026
 04:52:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com> <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
In-Reply-To: <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
From: Stefan Chulski <stefan.chulski@broadcom.com>
Date: Mon, 16 Nov 2026 14:52:38 +0200
X-Gm-Features: AclHuK9lYUd8y1LqoNm1jEUvWpEAcJYPxDr98Khy91qci9OKo3WAm_R4ih0-tig
Message-ID: <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Lifshits <ilya.lifshits@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007ecc630660644192"

--0000000000007ecc630660644192
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 2:10=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Mon, Nov 16, 2026 at 4:49=E2=80=AFPM Stefan Chulski
> <stefan.chulski@broadcom.com> wrote:
> >
> > The "ksmbd-io" workqueue has always been per-CPU. Commit 69635d7f4b34
> > ("fs: WQ_PERCPU added to alloc_workqueue users") only made that
> > default explicit as part of the treewide transition to unbound-by-defau=
lt;
> > it was not a ksmbd-specific decision.
> >
> > Per-CPU work keeps request processing on the CPU that queued it, which
> > is good for cache locality, but it also runs work on CPUs that were
> > isolated from workqueue noise (isolcpus=3D, nohz_full=3D) and prevents =
the
> > scheduler from placing blocked or long-running workers elsewhere.
> > Which behaviour is better depends on the workload and platform.
> >
> > Add a boolean use_unbound_wq module parameter. It defaults to false, so
> > behaviour is unchanged unless it is set; when true, "ksmbd-io" is
> > allocated with WQ_UNBOUND instead of WQ_PERCPU. The "ksmbd-break"
> > workqueue is already WQ_UNBOUND and is not affected.
> >
> > Document the parameter in ksmbd.rst.
> >
> > Signed-off-by: Stefan Chulski <stefan.chulski@broadcom.com>
> Hi Stefan,
>
> Do you have numbers comparing the per-CPU and unbound queues,

Yes, on our systems we observed up to an 18% performance improvement
when using the unbound workqueue.

The primary reason for this improvement is that with the default
per-CPU workqueue, ksmbd-io work can sometimes start on a CPU that is
already heavily loaded. Because it is bound to that specific CPU, the
scheduler cannot move it to a less loaded or idle CPU, leading to
bottlenecks. By using WQ_UNBOUND, the scheduler is free to migrate the
work to less loaded CPUs, which significantly improves our CPU cycle
efficiency.

> How does this compare with the earlier following RFC ?
>
> https://lore.kernel.org/linux-cifs/20261022092514.2590010-1-huiwen.he@lin=
ux.dev/
>
> Thanks.

While both address the underlying scheduling limitations of per-CPU
workqueues for ksmbd, my patch introduces the `use_unbound_wq` module
parameter rather than changing the behavior unconditionally. Because
the optimal behavior (cache locality vs. load balancing) heavily
depends on the specific workload and platform, this approach keeps the
existing per-CPU behavior as the default while allowing platforms to
easily opt-in to the unbound workqueue when it yields better
performance.

Thanks,
Stefan

--0000000000007ecc630660644192
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
+on8kJB/PnAxkj03/27iq+2cUc24qOys/j8E0+8b7g8IqeBaIpwClphXMx05qyEBoWMAIpQLZbkr
OATk694WJesPHv9odFrMQtDbCLh16vurgAd9Qq6mgitZPPT/GHV13zkVnDcZWG4aDngDu5ndfy24
0TvBvFiz97uV//NoG5MT5mkYufFR7tyBwvBpDXUTVfngSJoqcaYQp1VFSBfcxcwHZrHAg0JIoAwz
hB4nFy1Atlx2IGORgTec+dS1Pqb/eM9gFpM7GIvVcUZJeo0CAwEAAaOCAd8wggHbMA4GA1UdDwEB
/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0
cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5
BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIz
MGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsG
AQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4
MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmww
JgYDVR0RBB8wHYEbc3RlZmFuLmNodWxza2lAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUF
BwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSA6GJTxU+RxobV
IBVB3gwY7k1pCjANBgkqhkiG9w0BAQsFAAOCAgEAKfbTNIK78LyptWReJFdtRrzB9gx3Jofx6oEu
aSkOv5+3/KNAtjL+sY/p0my4x5xAr+mHI6MNDedzID49xZdmI5u3800ZMGWXmrbaRpWmfo09/wOQ
xGZtfLy1H4piX46qT1DZkmiQtQYkaa7xRI2uiYZdllc+582mK7AGYmqPQFqbh8gX5DvxFV3kq8O0
0gsh5AIE7tRHb6VfZ3JCjxTqdiwL8WnTY7FslEK3p4Wc2A7ZxJM6amC+a2W7OqJGc+g/V/u9FZrO
RhtLtawYf/avRo5+p+cjx4rwXN7jN5qK28puewzFfxLTUsUEkyuICNEBK1xfUjeRwLrIN7M5+PDK
j66gi0licY/V9HrmbDOWh0bLATQTchsWZhY9Ih95akVDxnojrIHWohI6/ErCVV/G8qxL++gYG/rF
cW8Vyymevyu0yuWWLQYWWUONLwyXXNax3Nb+5gBB8tZnS/ByN5EIRsD9bWBk0Tq/P8cAfgpFyZiX
Zk/VjquAbx6WvASAhn/DcOGK5Uv8zH4HdeP+28/g+3owRPfiAppmcf4PHwoaxLA8BxVxvGh2Picq
y9is+1FwS9+fDcaMBLN8gZ/2OR0AYIekVjw4CASYMdNqfA/hvArgxjbhU/NhnxRTJ8kPZE5HCzyJ
/umztNrpaS8TJ+9J2QY2KsZTT3BQzF0AEejizDwxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBT
TUlNRSBDQSAyMDIzAgw32pL13CSveOhTCOgwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkE
MSIEIAvuchvdb+8v+FOrs/F6LepDcrVis4lcasz9bhXQpM0hMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MTExNjEyNTI1MlowXAYJKoZIhvcNAQkPMU8wTTALBglg
hkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0B
AQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAuv02rND9B+Vl9jEXwbinHxaPYb12Gq
kUdDUrZenhh985Dk3FqzyKfO1JPOVwAokAb3yVGR0zCuijNN4oF4b6XyzXsiTwELh8PXD+tWYoCU
5efTSRWWwoNyrg2JbPZ3lB5gOTpjVCEAKYpX+9RHZra7RLMemJwiwL9a8FRFMkEr6Qock0wxeVze
m++lJKFWeqrEX8XZBW3dUfcW+7Y7czrSy4ikcpyRmsK159K7cPdX73vGhCRxWpseyrQhpMdTSZiy
xrf5TlKxJiHUVjxH4C9ktw3qaSrio8ON7tJzeO9yTLH4ASdmYxBeD1IcXjJYSfHa8woN4crDF5j+
V+NXU9E=
--0000000000007ecc630660644192--
