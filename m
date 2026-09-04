Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B137A83C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485679; cv=pass; b=RkR0dT9LWhqMu24ciCJdueuGndt6PbKJvmxeVSaex/fJL7yCj1tbxpvHKjP7i3/QxWwdkxyT8XlahVw9MSoJomlbcR7hD64WabNmkxCRoRDS2Jd1bUWo1eviiVw2Roo2xRksp+034EAiUWW4+ZpZJhog7a+erIjaF1e8wI3EWbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485679; c=relaxed/simple;
	bh=cK0R7kBY++MQb7CTUOJ6U7itzCElNOr8R8M1UgJGgHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieVkobvwQ5eFkgr73Wc1YicnaMhfRQKov69Gga6MHbnwbApz3N9HynGcf3HWKHziXtqRjMJkZh+4i7D+XI3t5ul4Fn5mWHJCoIhnay3Q1kzewIKUgQgfqGVMbYunxDqKw+Aga8AZSTQJSyQw5i3KIWbkUMbUGNBTvRPa1pc1iWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE5hSOvo; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE5hSOvo"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso434349a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788485673; cv=none;
        d=google.com; s=arc-20260327;
        b=pAN2ZYDpvMQOh+JlbJlE61bxpo43tyM1j5g97NbXp/Ai5sgSfrYC/wts2EFfQoVZkv
         ofKBiW7KQUwijPSUKd2k12EmJqyurr7ZewF1uZbO5udzpKF+7/JEdEy9fWT5MvOXk9Jz
         7+gEp9jDXAGKcxdSyNdiyWOV2HJxVSPshfrHjP9+83ell4FSo+2+3/4sAlcmb33BBqXM
         Up1QGPqCJB2GMsJMBJdphLWbdOSssCmp9FN1mRPgb33Up7zok+gS2zdrkPGmf51U9xlc
         /qo0fVpZnWxBVVpuXjTXOXKuDjCBNjbRwc3793ySzs2mThg1BYL43TLkC/lwDrQO9khx
         fdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cK0R7kBY++MQb7CTUOJ6U7itzCElNOr8R8M1UgJGgHg=;
        fh=dCEMNKzqxm25fd51VIa7Bcy5clLvZPHh7M9cZmTkYA4=;
        b=gTb2MM30NWPgHwKDu/QqOaO8efJZkVuGj9as6tYJk/4ACjRq41wGrC0tPcR5xlLRfz
         ytNJXbYjKQWFZ0Z3UBX5cbErjhfMO782Jz78aw4KyA4P4SiJF11eeP4RiuvBuHI/lNJE
         IaBxj1WM1eLnHC/yYrRJ6+T0YDdr8joQryZ7B4z5iMTKgDTSznMVqJCkNd4Oueo+42AS
         KoCSW2MCsXV0DZ4e8y9B1SZyGs+xj++3pH7UuZDH9It+qRtgCdCrlSn/F8UeGjnFcgyK
         IFAiJfLvVPJdpYN3+xH2sDdkLTjtsPra8mdD70UiUCD3uYZsGWCWjPylWa7DHS54hw0z
         iZrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485673; x=1789090473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cK0R7kBY++MQb7CTUOJ6U7itzCElNOr8R8M1UgJGgHg=;
        b=VE5hSOvoKIyDu+WK5S3scmCFKKSpyiUxSClcHBpKP9nUduz3LtLXCw16gOhxdJDUBH
         DwDwfmYVrAcaT5FudShhpDDBw2XV3sl6/Ne2fEOgOATBVMfF+9JB58cX4FuX1/9nKQpB
         P2oQ86sxpINC1x0XO9z6WvoKZbzJ0CjVaURl7jn2nzbRBNZvhuxp13OkNC0e6h//pdvD
         AkmGSzGPAVZ5MiQKz8tsDtor5mbmFVB71HrMqP/LrQ43+gFarsmAeBNUW9qssgsQsE/e
         pl9JI22MhAw5lJcZ5lsNFBTNQfqeLOUSyCUzcFtOgW/kPecYpuDjzWFDjLhCNG0bGdD/
         8v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485673; x=1789090473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK0R7kBY++MQb7CTUOJ6U7itzCElNOr8R8M1UgJGgHg=;
        b=nZKk0Ycj0Y3KNk6myQJF1mjL48XLUGidJZZobidgf4crIbT4b54H/9QIAYMyhDF7R2
         FJAn3wAnWDyZYP2tkcXbLGb178MAEhcASbvczjpyRcYyAzKTR4R6SA/4SD6tNbwHHpmu
         +jAcasOy2/jRfc66+aBLgK3WjVSrAKYq7mPJMjYr85l5VRh13ew6OUBWIPqndYMm6uWh
         T6DPBYa7Er/XYAfgwvOTalkFjNR+ZZb5/ZH7oyqY/pNBSLf2zRb8UtFrSmkxxRZr1Xd7
         dlPWCcnR1+7g5pfAnEaqvRZ18c1kZx4AMg1gHeCNR1UTnhrFfZ6C06XsaEbP3lADE3Kw
         nOEQ==
X-Forwarded-Encrypted: i=1; AKwUvByAOtqJHfgSgSklaWczGM4gNDte6B2OIFlcGG+NfmLcItKrSvcSoRAtCjF/A3g3klOu1IFM6ZBUtBvXS9E=@vger.kernel.org
X-Gm-Message-State: AFuF++kHJCp+ggVFwuaqSQUfywiqADvgoHViquu+vKpvl0JAqC2Uu7os
	A4PlypBu2aB+tpSCA1dbLwajThni441tD3xUFssHuhahW+fGa//W1km8Vh7+PihoeA+N3D3krUO
	P2EZALbNuwDeKxViR1yJlYK4o/djSzSc=
X-Gm-Gg: AYBFou1pnd3+0K32vuehCOpp6KHo5ZnIPrtggUS9VtqjXjUMpdIUqaknj5K5u/hXa8t
	h6YtNJrzvC2djtSitZuuRHSzBpTuWpnGXv0DjaIk4CgvBDoIiQzdMFMKGe9/QOZgz2hGoEkZgQ3
	4Pbtcx0ylExXc6o43H2weBjKvub4w+5WY067uthv72QiXw+/4slOzXBuDDDRAOeMDx2s6QQ6St3
	nKJw+hgSfG+EKpAPRqNGUJ2oMBa/jk5eFkct9CImaTGie/EMIJRM37xFnHCTTSwrK1Dh67KXJSK
	uy3KlIl9r8z0Ss8eW34AWZElFDQKGGufTl02wN/I6Wav0w==
X-Received: by 2002:a17:90b:1c0a:b0:398:d132:ba76 with SMTP id
 98e67ed59e1d1-39b2623abfemr3571198a91.21.1788485672899; Thu, 03 Sep 2026
 18:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901134604.4052265-1-dolinux.peng@gmail.com>
 <20260901135715.4812fde9@gandalf.local.home> <f18beeb4-f3df-41eb-9990-5be295a2729b@gmail.com>
 <20260902235533.ea387f764b51b1b2a8ce8224@kernel.org> <20260903123606.6e5bc37e@gandalf.local.home>
 <20260904084808.12a9c7a1c4bb8353d753e026@kernel.org> <20260903203013.6c844daf@robin>
In-Reply-To: <20260903203013.6c844daf@robin>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Fri, 4 Sep 2026 09:34:19 +0800
X-Gm-Features: AcwNN1VvHXHQXTTD-eX-NupbI-Jls1eReHqQFNYGLhAnvQhdHuIKnq0UQhFnUVs
Message-ID: <CAErzpmsKktMM-RCH9SaF0pWirS8d3fS5Gm_ER1=HtbdrYV8+eQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Use BTF to trim return values
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, dolinux.peng@gmai.com, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pengdonglin <pengdonglin@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:30=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Fri, 4 Sep 2026 08:48:08 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > > I have to ask. Why do we care? Is there a use for this information?
> >
> > If the structure itself is being returned, representing it as a scalar
> > value could lead to misunderstandings. Since we can check it is a
> > scalar or not, it should be noticed. In this meaning, I think "(trunc)"
> > is also good to me. (at least user can notice it)
>
> OK, after thinking about this more, I agree that "(trunc)" is the better =
option.

Thanks, I will keep using "(trunc)" in v6.

>
> -- Steve
