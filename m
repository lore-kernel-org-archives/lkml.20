Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794411734;
	b=TKYMculahkq/P2ukvq8Xy6bg0iXrc6/o7YY6k2kZnxJz8wV01UwFMJsXlAf4s/b1C38U
	 3lUl9J366Rtms5lmbSqxgVdAkUTdPchB5y9dB2XOuhgCdAiN0yIXfiZlTdOi8FC42IgmE
	 /HJ+oYZShG87CwLk9+FFCJchpscKy4wGHf8JH0/N7NP+UeOBRgioT+4cf9BxzrdrYhsWe
	 bVsZYZGbrBHVdhPQabcB678jlLyN/wXeQD5emlfoP4pFsO/vIpW4XZHhW3EJnR2rjy51t
	 9f5eYI3waKE+LbqvU6d0M1qRq/+SEvWU1s4KmErqp4drisEBg3WvIsIZGFBWBAcG3dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZD+vbtbPmFOJcN2OyXTBdL4gMWgwvLA87K5+LSebFco=;
	b=G6qiVd6To6Ts4Tc5Zftz8RzZ+aD4Q0+VXxJx+cyGjPH4FvLEgsU70FhFqRn9HRBOR3J8
	 BwQAjfepmuV92VUhubwWEklWhTZNI0VNCtm5JxhI84Y9GYDuK6uWyj6iBWTsOhhvRo71K
	 aah+fo5QKxDmRUUJQci8DDnUVlRmtkyRi36g023+TZh4iuSHcgHl0GIWSJ7SQmkuKfys2
	 JovSJM+08pljENLA/9fMdvrRINkmoh/77W44aKtHr2zs7hcDAWqQjV7LxKOnKCxirs3mq
	 6EfoklQDYJP7+gYFtcnLy34qzXojGsyuiY+7yqMBBY18CKD3dzMQzkXqaFYS2O9Ecew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILrsDdmm;
	arc=fail smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1777606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1777606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILrsDdmm
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37198ed3727so4021642eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794411733; cv=none;
        d=google.com; s=arc-20260327;
        b=L2UCwwTYqdyvReU/T0N7dMPEeHEFGlYEPK399LCWma9suL/HEd0WkK9g+pPD+nZNmC
         t79t/u+oue/fGucBj/2GbLlT1+m5AL2s62am0s/owu4e56TArq3Hzu4C8848ycl00xqZ
         X23zLVEa7MDC1bZmcxDUboY5G4bFcczXaxrrYoiPKIJiEUx3f5o0d7kYq8fuV5tIXwhJ
         2Vv2M8nLzhL+CFZkQ2HZM+dqT1/Mvf4u3kJT2zEHBoJPiQcs60ghfnImY8d+DN1hH/SO
         QCzCvof6PLDjVnukUHTCsaqFPsl6qkqVP3dFEW+HwLo0dx9dn/2IJJtzn2VSgLhLhK6B
         fNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZD+vbtbPmFOJcN2OyXTBdL4gMWgwvLA87K5+LSebFco=;
        fh=XTNSylZDlv/gFR0hAbuzN3MUNHn1mMgdetncJi3FNCA=;
        b=DO8lwsBDtq92lTyWtoEsTcd3sj5rsRTp1LcmYQ6XONlcUt9ICUUpdsIsz/nfttfreY
         8eRYJMLMp0qcaxJNWMe6pp/91VFIoSMar3C3R1OkItxBnmR89iQE//3psGaSVG/s7AVs
         KVNdQcSwFhqjp2N//O99jzctTrcehtdidCBLCN5AHf8X2BFJA7TFjLVZxCctM+2lRfqu
         YrS4t4pBRD64wK7QgbOPUdWueioYDJhYZ0JWz9rRLnCKVX9fjjOkz9yQK6fxjyoTKJw7
         aTL6RPrI1VjSKXtQ9phb6D7XMgBD5RS3fP1pSOWgq/DLgwu2FLixl8Q39edjLwR8xoDe
         Wn/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411733; x=1795016533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZD+vbtbPmFOJcN2OyXTBdL4gMWgwvLA87K5+LSebFco=;
        b=ILrsDdmmAvzqhD3TiNivNeF0J3+4JJsWrW9RQqTyes0Jt/1NIaT38z1TSZwlRZiVcy
         98MR5a4CwfT/wbSrYAoqvQgQnCONz6ZmLwipoJB32SrMrl1+ZbNF1O1Q1BC0mBBDcmDq
         nR3JIdl15O8tUaCjVcBRZ5CgoCZCGtH8v5dOQEek1bcF/FejZXezQwcOGgDag3b92qxR
         547BWc2HmXMoxFFxZqg0vESpxdfk1lcGoyHdtCM186PCuE1shfkKEioix2RrXy+5hVEE
         uZ/FHlRnVle2GxQuaD0QmME5KVBngRYC2Lb7MYBKm0GvtOleg5aDWY6AjsIEIH8N5uXe
         TAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411733; x=1795016533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD+vbtbPmFOJcN2OyXTBdL4gMWgwvLA87K5+LSebFco=;
        b=oqSkOtW9Yja1WpJlUiemmqf0vkS8n4HC7+CfUk3wQBHavQARyndcgRnKes2wCEVQ3s
         +8w8XC7MWqa5m2iME/iuUensK3lShvEvaGWyQU63Ym9eKFb3xWxY1r3YGBKE4uN2qzCG
         77cPJYQCSlElLoi9UoeWCZZsjdiNBFGgM11DgWVIkpiTSef69FZ8Z4PZKSaWhp0iHlLK
         7Nka+NbknNEX8e5AM4d5OhN64hzdiPMVKJRTzpZJnVu7i6/CAEjV2HhICavqdM3wtat0
         MhQ2Xy+aV6Mw62zA5g8JTfk7m3PWc4pdnWox5/U2sMFxyOEbeCPixYbLYHt2Lq2eVh3z
         68uQ==
X-Forwarded-Encrypted: i=1; AL+hErHAmo5To8oXIhxs/YLkdtB41rKt1pCL7RPNtrPcrxvspnOtb1iuS8VFwE18PrE2nnc2ujTPqjPIRRs9QBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++VcMwi2qtZRcWbphfHIiMwmrsSc5qDq/JlXf7Zj9AQo3AIPx/
	PggFvM8NzcwC4irnafxBM3hT436Av5AIdIeJ5KSJ2AqpGrLiI95SMXx8k4OjEi6RERYLpqau0KM
	7pvKsNZwUs30EBJF9F5oZExUzOH+eTiE=
X-Gm-Gg: AYBFou0ua57Ncpz8y4mE1ZlW/AwkHC7+dSG2FJ14KmeTQaCxATT3wjIH/wJA+54QwJ3
	vkbfG1FBUW4RNntZ9WVzsVV4g0+2y6eiyv2iXsvfskazfk0UhWPOzh6xolMBdOHGTqAZYHKPFyU
	5PSC3m3eVnVjvDZgkP4OT/MnTmBQdduibi2H7OC3aOiGClRNLSYCNt5qhUawojOhtFIchlFYOgZ
	yA58j3aMH6YQ/mueNIZ65CMMycnxJD25r9nSTgG31qpcO2ZvHUDztZqA5UWVUEH3UZ84XINRCkl
	ySDuZ5iMb0fjoMh052MsFFgRZMoWQL6VY0FLDi40ZeS1ZCcQZoLhltL8ZLFwjbsr5uT3cdQexLz
	8+wcjvhgHUx7HzHW9Pab19tTWCPVoU8B/eSeYdB9QEmFqrt33+OIu2cuEmzO6pCZm2eqo1A==
X-Received: by 2002:a05:7300:d190:b0:361:2a55:b94e with SMTP id
 5a478bee46e88-3766a2fc88bmr3428916eec.15.1794411732633; Wed, 11 Nov 2026
 07:42:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111090447.3047656-1-hj351016@gmail.com> <avR_tx9ze-eAa0_N@ashevche-desk.local>
In-Reply-To: <avR_tx9ze-eAa0_N@ashevche-desk.local>
From: khj <hj351016@gmail.com>
Date: Thu, 12 Nov 2026 00:42:01 +0900
X-Gm-Features: AclHuK-fUYFWM7BPj5Q2pN3hGxopZ3Dab9DAvaDPkb3_oUwcCHkHx9Q25tIIqHI
Message-ID: <CAGr5VtMvrt0OoJ58FPtaGy1tcQGqW9VMhZMb0dA9rg1gA5TSHQ@mail.gmail.com>
Subject: Re: [PATCH] HSI: ssi_protocol: don't cancel_work_sync() under
 ssi->lock in ssip_reset
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Kaixin Wang <kxwang23@m.fudan.edu.cn>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 > But is it okay to run before timers are gone

 Good question. The three timers never queue ssi->work, so cancelling the
 work before deleting them cannot let a timer re-arm it: keep_alive only
 re-arms itself, and rx_wd/tx_wd just call ssip_error(). ssi->work is
 queued only by the xmit path (ssip_pn_xmit(), SEND_READY). So the v1
 ordering is safe in that respect.

 But your question made me look harder, and the real problem is bigger
 than the lock: ssip_reset() is itself called from softirq context on
 several paths -- the rx_wd/tx_wd watchdog timers reach it via
 ssip_error(), and so do the ssip_*_complete() HSI message callbacks.
 cancel_work_sync() has an unconditional might_sleep(), so it is invalid
 in ssip_reset() on all of those, not just under ssi->lock. Moving it out
 of the lock (v1) does not fix that.

 The cancel guards teardown/free, so its right home is the process-context
 stop path, not ssip_reset(). I'll send a v2 that drops cancel_work_sync()
 from ssip_reset() and does it in ssip_pn_stop() instead, which is still on
 the remove path (unregister_netdev() -> ndo_stop), so the UAF fix is
 preserved. The watchdog/error reset paths do not free anything and
 ssip_xmit_work() bails once main_state !=3D ACTIVE, so they do not need a
 synchronous cancel.

 Thanks,
 Hyunjung

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 11:46,=
 Andy Shevchenko
<andriy.shevchenko@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 11, 2026 at 06:04:47PM +0900, Hyunjung Ko wrote:
> > ssip_reset() calls cancel_work_sync(&ssi->work) inside the
> > spin_lock_bh(&ssi->lock) section. cancel_work_sync() calls might_sleep(=
),
> > so running it under the bh spinlock triggers "BUG: sleeping function ca=
lled
> > from invalid context". In addition, the cancelled work ssip_xmit_work()=
 ->
> > ssip_xmit() takes ssi->lock itself, so waiting for it while holding the
> > lock can deadlock.
> >
> > Move cancel_work_sync() out of the locked section. It still runs in
> > ssip_reset() before teardown, so the use-after-free fix is preserved.
>
> But is it okay to run before timers are gone?
>
> ...
>
> >       spin_unlock_bh(&ssi->lock);
> >       if (test_and_clear_bit(SSIP_WAKETEST_FLAG, &ssi->flags))
> >               ssi_waketest(cl, 0); /* FIXME: To be removed */
> > +     cancel_work_sync(&ssi->work);
> >       spin_lock_bh(&ssi->lock);
> >       timer_delete(&ssi->rx_wd);
> >       timer_delete(&ssi->tx_wd);
> >       timer_delete(&ssi->keep_alive);
> > -     cancel_work_sync(&ssi->work);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
