Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256986;
	b=VmW4UVwVbzFuxXx11blRqso/L8fOG/tQRTJcKrqxwCUfscY4+STrTqr+hOo3meqjLQzq
	 Hl7em/YhMAVtpK1+NpO3yn4s7/jmPdhq/cp/ZRQeD8EZ8wZYey1M89oQzbGt/ktV+MlyX
	 wZC3Z1psO5OIX2QqVFmYlvPrU2v2yGgLiO1X0xkwMQWmDYH2PBdySHK3VnH1a0k8gLb2+
	 n7VsrTLUXiGQjFQqpPmnYkT+1pBJanwV4jQzhYJhLzubpHRgcZUNw9VJFPTsZmzIby6bj
	 DKE/kuVKtuwCgJkCyMYYvpPh0WgBuZbIr5Qz8TQpfeRQfkzMJa+9f3NaELVrObn6BPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256986;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GM5RY81tK12IzXW4FZLzBT6HLn10WhpijMYtwZrR/Vo=;
	b=KVgVlGQUe+cuDuH6tvkW2MegqsXWJOmK8LaUDONrlfT08Jv3T7H16C68wqpxuAx2AMzs
	 9uAeZv+oJkksGokMb6tLw/YKghwNvTRRW1li2VYKz3TF5et2qmlyik72o9kVaxJWocsL8
	 FbPzBqlN3/TmjezaBa719qwpLvsZC2I1W8wn995AanjyUwTzKFYnEvvagRtdV4wjSfR0a
	 JzjlkMg1hAfqnZnLdWGTM1LZHkMhzl10Xm4SKitiByvMDT155GEs1K/RHeg5hNBaKo0mn
	 0e7cdAwUst4JUsSsqWlfgri5Obw3Q8/7hu7HzAuLz/g9RvZI7XobmrYttNDBhYnJzUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=BWBxKK4q;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3153606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3153606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=BWBxKK4q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794256982; x=1794516182;
	bh=GM5RY81tK12IzXW4FZLzBT6HLn10WhpijMYtwZrR/Vo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BWBxKK4qbVxZ7QRS+kBfPR37Sluakf9Fz6gnMv1QMfYehhdLAvU45A9u+9yMfM5lO
	 hl8TuWx97Tc49nIQ4JatZmQfA6/wNOnagHXJgv+x7GW3hKIhJgtYmBdOwPVWVgBnUy
	 uRqrWLkM2BLXdigfNtGp3N4LaE/KwdTfaeHVhD143/W36Q36Qvag1PsxES1ChzBjiJ
	 3vqhlo0WEwyfGw76aV1Nc8pEtg2b/FKcc3bFYmU3t7rULE2Ku4PqkNX3/ZkUNGg+MJ
	 E7/omH4E2WocMEJqIyAula1Zuj0F9+nUIF/fDqitJcGRZvAjbH/qHVQ9/nSkksZO4n
	 vYMOrKnK89AFA==
Date: Mon, 09 Nov 2026 20:42:57 +0000
To: Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Add missing PMIC identifiers
Message-ID: <qcxc7XsXmVOXMH3T-UIFGOexo2Qh1KtJspYZ15UrL2Tu_Jg6Uq6-PfJYTlJoipYPZnMnpNXN6wbs6pnJkkLTiQf4O9uOnp-NLJc-13wxigI=@pm.me>
In-Reply-To: <20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com>
References: <20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9fb916162189a8de3474dd64c23fe8cc93c2ea41
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, November 9th, 2026 at 10:39 AM, Konrad Dybcio <konradybcio@kerne=
l.org> wrote:

> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 38efc5db7fa8..6ed8a4686e2b 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -154,15 +154,22 @@ static const char *const pmic_models[] =3D {
...
> +=09/* 68 is unknown/reserved */
> +=09[69] =3D "PM8550VS",

Duplicate?

>  =09[69] =3D "PM8550VS",
>  =09[70] =3D "PM8550VE",
>  =09[71] =3D "PM8550B",
>  =09[72] =3D "PMR735D",
>  =09[73] =3D "PM8550",
>  =09[74] =3D "PMK8550",

Thanks,
Alex

