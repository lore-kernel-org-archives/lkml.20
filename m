Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB153C09E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773413; cv=pass; b=XoWPTmIkGVjc+blv5eH0gOBmpuACOCTlNVBzzGxowxESHssJBimCPy+0RKrPPJQg/HelkRvT+64ukFKktH1ZVCIcfryMiJsljSBDP3BU/ng9vJ2CNBsv1YMCpt/itnKECMwB9diITy8EL/3AnBQyMPs/Ckn1QKepgoKYDhPDs84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773413; c=relaxed/simple;
	bh=JvmNcko8GD+v5E6HsKTEkSQ28ljPR6ImDCyaccuVGdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axLv7baYuVdXXE5gzwd8rosUZcklIUlFw07I3mNDsgeMOjWUDhnDa6w4PFlweq+Ys4LN4FbKA4HbvuRlxcaaeZJjp+NMkyY+zW+R8Rvzs/jpK8Q3h1DdbZxdvWXDuosc3cyxtAgPzQ2PICYUmdRXKGy0wqXczuu0TpjcJk7tzao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g0UIS4Mf; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g0UIS4Mf"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4af4be667so3154420e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773409; cv=none;
        d=google.com; s=arc-20260327;
        b=Ac0ynDqDakBtM9k7FWXj+0ByHU7kpXCeuQ/pk2/Fg+mUlsZ+7H13H/JsnbmsmocGuh
         V42KpdzLEGvoPsyB+Pq6iFDw3TMS0jZDcHNnzLn2i2HnUvJNH2ECxvSGVHdi4deN7jmm
         k/MDZx968TnXOCSzYOKBqM0NLOuE6i5nTiOPUAEEzdILAH1UTtNycOVp+Piz5fqhbpz0
         bLQhMtr66/FzD6SJYyI8fFb/iECtDGvke8ULp0IDjYwbv3bqDJdPejLDfuuQ1tDJM+FC
         j9wfMi2uFWO6czCYfSt9OdkWtzs/+zRraBcU4+w8pNsOQ6dG0ai4m8cjUVa/zSc86x5l
         8zFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MAMGOQgh6V6cZHSOip+7dmeGqaDf8whNTKI3l+hdyFY=;
        fh=wqpym5wdywHKX1k4LfSuYEIgziUVveNNjJlYs87qQ4Q=;
        b=SDT57vgfXnCW/UAUxUM7R7HBTRzbggJbn3BQ3DjcGwpbtqq+VJL061QqmNy4AsX+d6
         BYuFJ34+imOKRCa0nttzzwLXkayzsBsAH+Qbh/yUzErKe8ineO/xyy1BiugMR9oPsIz8
         j+4Kd+/jrOrUNi7Nf+eMOm0lcCIaNuAizKcusKTLSrcbePOPmsA5Wd7sgwLCCf5xvdWB
         MgoQp8CyM4iDxyAUlL2PCgi1Tg/tUr4+hofUzyrLXNRTIJ3y5ZP/Cq/SIO7pdyRYEKsi
         T0/Fu2orPT9nfI3pIO+AA+641i0Q1szFYO7HCi9L8QCfvjWVfRFpjCxekw4VZcCdLUWh
         e7fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788773409; x=1789378209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MAMGOQgh6V6cZHSOip+7dmeGqaDf8whNTKI3l+hdyFY=;
        b=g0UIS4MfWnctulezhgqmSYrtKLio4x0zwLJbMwcxoW6MedGViF+sVSz7ine8j22qeI
         RkrXR6aU1ggvBfWEqn0RBKolQ+H2D1Ap6VcVhNYRs8gA0TWDxCUBJ5JEMmkWukIe9K+/
         S+0O+7VtVgs13uGsJwPwLK9m9L5ZUJ+WIJ/fI82KHs9qr6KtbYVBpCJraIkpG4/P78AD
         fZgPeOdH51WrRuCjljgLO6ujZ1bTBysunHgljfFst6B0uW26I3hC8esQ6kCFZwoaDBYq
         rBtlxp0EpgYp2VkIi5Iy9YzXTwTaSibl/ZSh9IX9jUbvbnPvIao2+YOdzkYiHf9ne13t
         19tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773409; x=1789378209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAMGOQgh6V6cZHSOip+7dmeGqaDf8whNTKI3l+hdyFY=;
        b=RlXpeuuoX3/UMVppLDGHuXYBxH4xlfw4O04t9jpaGXLDKGeMvUJIVzoKa9Lef1iTii
         TBpBNEQaGdr1zAK2AWkZ3eFIOmehaB8kEkrGDiCxrz9VBp8JMJydv1RfGl3/v6tiIbVU
         l1p/tlBa31zbj7mIiNX+trj0TSR+SXq0Myqhc0B2dJW/g4yUOuVVgCbUHQPnTaxmT9cC
         P5x5MoLuCcWBxF6Tg470oB33uBUgtfbF2J3Aqpz/7POPN7w+J6dlVZDwts3kVxBqOtte
         wTqji9+K4JU3Ku4sR629Ch8M15cDNgCFDKvDri1LC9SshxtMQsARIRc/4LijJqekeDGc
         cTng==
X-Gm-Message-State: AFuF++ljpSoWB5C2dvWtXKGTY4ghHU7xbSmsBX8z/H75CgK4bT/r4Sbo
	HC9TpANYizGWFvsDZz77Gu9JIvxySB6sh9a7PJcrIliL3s0Iedl7kxG3vE5MhdOxZzSfHfaguVF
	xgi+RoAbsV8Y2xtMQB1v9oRO9pn8Ypr6rvWrHzHC0vg==
X-Gm-Gg: AYBFou2Az+KJa45rfcht/dzTRm/ZXZyOnVLp+rx1ofGznsbu1ZvY44opArj1C5nApU1
	EmL0I4TAYAwB5jAIgbuI0MmbwmBbakxT26sRrp/3DOT9CRmLBcdfeBva4cE8QRDiHXsNGwLj/RF
	uzcxkpvTaqBKL9L4JER6Opg12bpbnXL0z/NyXQnWi8SBTU+/OzxF9++Kd6kWxK+t3sIjoS4iRhn
	/PcSt1AJYZCk8iw0htb8o4SV7IqR4hupZGt2XwnqwzjMSy9Wh/wlfWyBqS563HoHjUbJlJliCti
	7vQ8KwXR8NHgEXN0eYdn3Lhrf1iX1kEPcro8IqofKAPNsRg/WTNBEPww7yK1KGSyYAh+0VVCt2U
	PKg==
X-Received: by 2002:a05:6512:6685:10b0:5b7:5c18:b7da with SMTP id
 2adb3069b0e04-5b75c18b8f2mr96919e87.32.1788773409263; Mon, 07 Sep 2026
 02:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904141421.287647-1-marco.crivellari@suse.com>
 <20260904141421.287647-2-marco.crivellari@suse.com> <d0f2a6dd88101fc30b41f7dfdcb46f8d@kernel.org>
In-Reply-To: <d0f2a6dd88101fc30b41f7dfdcb46f8d@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 7 Sep 2026 11:29:58 +0200
X-Gm-Features: AcwNN1X64tfzlELvxkhK6APKe7_Zu4h5Ee00X7QwUQPMi_f0gg3khcJ4dmksyGw
Message-ID: <CAAofZF6-xYD2nef_a6QkjZ54Y5phPBZ1TubjPR4pho+PXZEXtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] workqueue: Make alloc_workqueue() unbound by default
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Tejun,

On Fri, Sep 4, 2026 at 7:01=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Marco.
>
> On Fri, Sep 04, 2026 at 04:14:20PM +0200, Marco Crivellari wrote:
> > Currently alloc_workqueue() ensure that one among WQ_PERCPU or WQ_UNBOU=
ND
> > is present. Now every user has one among these two flags.
>
> rvu_afpf_flr in drivers/net/ethernet/marvell/octeontx2/af/rvu.c got misse=
d
> and still has neither.
>
> > +             flags |=3D WQ_PERCPU;

Ouch, I think it was pending when I sent the WQ_PERCPU patch for
"mw->mbox_wq" on the same file.

> This isn't mentioned in the description or the documentation. Patch 2 say=
s
> workqueues without WQ_PERCPU are unbound, which is now false for WQ_BH, a=
nd
> the WQ_BH section still says WQ_HIGHPRI is the only allowed additional fl=
ag.
> Please update both.

You're right; sorry about that.

I will fix and send the new version once the other patch about
drivers/net/ethernet/marvell/octeontx2/af/rvu.c will be merged.

Thanks!

--

Marco Crivellari

SUSE Labs
