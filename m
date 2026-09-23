Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6751DAE6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201679; cv=none; b=jEJmaFJkloeaUf9BAY6SbWblq7VbXLsXH5EPB80FW/qumLLW98MMI3UqGuWv2QAJul0dhqseFfNkPR4i9mud3ZZ1Es825y4SIAORkj9FiCGXVvpeVppqnB1PIXrjqCkhSDAj4tgusBykCoe0halhsRdHZeyB2b5an37EyInJcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201679; c=relaxed/simple;
	bh=uJ9Ja/yw3DCK+Q8bIovnQGbdgYhEbxK9PA4FsD7RXXE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=MxFCYKUJQmYEby8ZRwhd+qzkCRlQTmqwsVCId57twQD81L6+TZdhxeKvGA6459nO5Vm1qcueZY3LxgfWLqOT58Q2HbcNrBYkHlmr1R/haK6PzO4WHAjSBtOekSJGRClYjJYxEw9ip+lcW3O+xtWaN354AR9tOZJ97dvT898FRTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdJHqS6H; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdJHqS6H"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a1676000so905369a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201678; x=1790806478; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6EYOTy+QnW26hbR5HcrXAKWXiAYxeIUHU6uN6hbrPqA=;
        b=XdJHqS6HDCfkdZn7Mo0OIKwZynepCer74nEIhXiLe67o+fYf8Ax568JL/peG4JyaN1
         NFDNQhYnPi5i3ygaFZrK49tk/2u4VWSMWJRHfu1nklG/2WJjzNOcqk8NWjRCg+zym4Oh
         9Jxio1BAVtYpJDn+JIEby7fVT0ST7ryfhqcF7EmOtjofu43z0Le8ZOPm+xieJkOWAhcy
         bgKRYQfMcmpIh79ZEmXMfnM7yHHd7kTF5EFARhYnm3PFYRo7fXdGTwzHbKtm8r/2kZuw
         4Lb85PJJ4G5nSPYoM8b+1XlNcgCfUdFI2DjuY1uk8v9+Wl46VgVPek8Dx95nW4wzEFg8
         TqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201678; x=1790806478;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EYOTy+QnW26hbR5HcrXAKWXiAYxeIUHU6uN6hbrPqA=;
        b=V0abVHT4nE/t8O+eCedCXpv9b3CbbC6H+YjeUTsqJgOYqp1Zf5NqfaEaf1gVI9S7Q/
         yXXzM/0oYu9QtuYjsfEhk3nlH+t9ZCECfZNEMz/3/3ipA3zABjhDQdwhZR1kXTuAvGBX
         RqrATD4DmVJzxdcqiQde0yZP3ZSQpZab0HxXrYK17nMobi3fwnACg8V0KFElHqUGGJLG
         +JnQh9beEO1uwO6sRHuTielCmOKCw+KCwCQbowKTnEEUTqejlfmCpVEp9Uj8P23bwti8
         hGNySdgpRfQK7tMOKYpKYOXrjEp2Cl0DFkFC1aDClTIbAAcgLs+MxZezTAUlRo6DbDW0
         WJ0w==
X-Gm-Message-State: AFuF++kI7Pd7ZOauHaT5wFp+OAXmReHRMzIMrtvsFmEJsRpgDDUmA2Bq
	azYUcFbZ3K/UlTRyg1isM/BrtOU2SsgnlJIQ775m/BsUvjXsUEjmmlDX
X-Gm-Gg: AYBFou2OPkII3Rywt6xvjB/65UIqnHSGg9W70nb+g+PLNlrANLYnVzCeWBImVSA3IX2
	x2ZAGHu4x2+WidyVyzt4jcXwwTNMB2u3/ZZMkxdKUbKdOZYoBfa8yk99/JyXQQFgHGOiDfH3kcg
	xM4yj4Mv9HMTQw5Hir+HU7WXvGQX0cpDXn2fdQh3trqU9IVJuK6jIHrrtu1U8l9991bUDid6IdS
	acJBRuq/DDXZmkrKo9Ho8/WOTAQNttDQpypVzkO9mwXw9FNWqvuCChtW41rqQVMn09LE5nuq/7O
	oi1xOQE84wBnnrQL0k6kdYcY4AuvYgG6+6qMqgHUV7DWfb19mXgLRns8OLfqJUbyepbnuKdxLsW
	3LzEWzj+p06yQeBc8rOAoE/qudzg38BWaEoptFY2XwMT/mdcaAPzIkmpxHXxKT+hLqxWrjslorQ
	z1zqSb7Lm5AXY1vyr5pySLZ3PAC2CyfOZzM5ZwCEqTj736mDpLWreeR08j6DeGvpiqQ8saOOUUh
	sqqLJwEilrwFivsG++dcE28qN2IBmDIV+EvVRzWYJwCC0mffzgP6HFFsuxTWsve9bpL+sd5ODNP
	EXe0dTttMfb3Zps=
X-Received: by 2002:a17:90b:2e49:b0:3a0:94af:19f2 with SMTP id 98e67ed59e1d1-3a0986e8093mr382567a91.5.1790201677809;
        Wed, 23 Sep 2026 15:14:37 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5c4sm1012390a91.5.2026.09.23.15.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 15:14:37 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 22:14:37 +0000
Message-Id: <DLN1J4YTAX4I.15CNAUSP5LQC8@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Yuan Chen"
 <chenyuan@kylinos.cn>
Subject: Re: [PATCH bpf-next 1/2] bpf: Keep target extended until its last
 freplace link detaches
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <chenyuan_fl@163.com>, <bpf@vger.kernel.org>
In-Reply-To: <20260923090635.368488-2-chenyuan_fl@163.com>
References: <20260923090635.368488-1-chenyuan_fl@163.com> <20260923090635.368488-2-chenyuan_fl@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, Sep 23, 2026 at 05:06 PM chenyuan_fl@163.com <chenyuan_fl@163.com> wrote:
> +	u64 freplace_link_cnt; /* counts freplace links extending this prog */

u64 ? It's bounded by BPF_MAX_SUBPROGS.

pw-bot: cr
