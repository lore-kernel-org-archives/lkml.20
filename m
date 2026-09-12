Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B637F75E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789241598; cv=none; b=pfpF8TM4MhqV/qliHvouqSaGCsRTnLvVsp6kH4efSqMGoKwn64jup83qSwEWkPFhGONN7WcIMRYSXWVMgD2G0RrMozy2St0YCvvsgI/KgzVEGJcsOLLuOluDVDU2IO9C77tW7T9eNKmzfXXHX1p8xftF04o5UrTkvbDYKb7KScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789241598; c=relaxed/simple;
	bh=I7Og+9vGtkyMApSATqOVCfx1Bj3bg4Jl2NcFFMMr82A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J8gOBu4eD7gF8zIX6FEQBKj5QlfyXB/ML4QyOPGr3K45OVESZ7iwTkLo15QkTLK5qn0bxLki/0bB/fMc/v4KYkcDebNypbf7bJq1JiUorJbB2m2Ml6eRUCZ07TtATe2ghbPhFa8nRJm8NmtzEo94AIgPTPafaS1Ip7T6GGjZ+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDeOobMQ; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDeOobMQ"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0c89e35so565933a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789241595; x=1789846395; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I7Og+9vGtkyMApSATqOVCfx1Bj3bg4Jl2NcFFMMr82A=;
        b=tDeOobMQ1tXo2VcXdtudpww7ZK+qjwx16fcnShR18zkMtmhhAQ9WOqc4ZeOCIqMuMn
         xOrhiqJlGLOseu9ssptphrWyhTG0UeR0/5/2pf2ZvqFt6f6/Y+l6Q1wyYyKxA/CkRAKJ
         sj7VGRJ4S8jpvPeGHYO5UUQyfzmBTXt8DBacXZoyuNVZtcQySYKr+lwBI+wugKrLwdug
         2uclifhnLFD+ZSt0lYlNOHf4d0YKxtq0XF50clMdqAGrEH3ntqpzlPIIyXKvRVOYOvST
         ixqMGSWURQ9hObiZ4P/Ir6RPlUDXZcKY6hcC0YUJP747MQam6fROTvrxkmhHSHhq87Vr
         xEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789241595; x=1789846395;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7Og+9vGtkyMApSATqOVCfx1Bj3bg4Jl2NcFFMMr82A=;
        b=Hx2uc45sdBjxlq23nIdKsgwAlQ/Cha+bii4vMLdfMD5Cth9PotLVOpRCb5YySRPq6F
         lLft2nGE2TO7GqL8waWxXpnOYxlOuXGMl25N8RIoiYuNdD/maIpyyTUZsd14zlQMLNVo
         zjY0gy5Y2oXW0tJIFOYhcyq+auGKwaq+uCOCpooVqpCQrp5sTrmBGi4tI1mbWyRw0B90
         7x94zWs/JHNtRlg4tgngHyiCCNrDNSMzayWxPoG89R1w6ChY/qdJLy0mro8cN14kzS/q
         mvdRz7xkzy1Fgvu5djp1hWcAVqlwbSi+YzgfFdS7b7TSqLvgaXmhV+5kgltZ2fgXzNR/
         hPkw==
X-Forwarded-Encrypted: i=1; AKwUvBxCLbmqSPnbIeMQJukTdfpBdlutMj9T4rAkm+DUASKgz5iUeqUyY1MR7biQGARbMIH0pGv/4SG1D8uqjsM=@vger.kernel.org
X-Gm-Message-State: AFuF++mg8fOuMAQofPhRTCaWT9UjyiVwf2VQ1n2pB+aLnc6RiAw0dNh4
	o4D++rZ8HdtyaOXjghIapbVgBTPaQ//vukkQOzVr/dGdUCcLatobnoj4
X-Gm-Gg: AYBFou0Qye0segus9ArhmPSDjqEo4M0otfNoPrI4VDjE+sLvLvYLfxYENdC2gKb5ujy
	ezgpFZDHbvUfw3pJwiRi5n7bqOImmlw/AxkPTGXLqnyv3G/SSSluWgDVdxQviHD7yqe8djdZ5cd
	dAOEQvZ3GXBKYjb2eMw9ckgGe0E//qhSHCcUYkSkFI46Eoo0me7oEYHawUcFNVhJ23KVjU6ERjw
	VFpRmVr81uAYQKGQVXakGajlPhczBhZ+Hwy84KDdVsYi9qeLAUtKvbE8oQQqTocnHw6sQ7E9VWM
	I9tFrMv8rH3tcAgYbSn6d8ZNP4wVZdogfVgk3x1AylHGkoZFuy8Rgj0y4jBgGtFOne9niKjm455
	D2JsbQ76uycKlBB+qcMrAYFJq/4Ra+Yz4wHDhKVXIaX4IrLqr0CMBQ825OBQQsGYDAI0ZdZu2yF
	a1DSqE4kv0x+D4AFMcEMhB6km5X41vcr+T3w3u6Q638JqhGco/WX8w8gn2A+Qf8sE3PmzAneil/
	iLHdYyhPIfPIpEQe8HzFp/ggliD5gcq+1BNaRrDAXcmNjwDRlt7f8C+fisUDbY9Ww==
X-Received: by 2002:a05:6820:5706:20b0:6b1:aa44:fc16 with SMTP id 006d021491bc7-6c0b9b54c2cmr4593859eaf.12.1789241595403;
        Sat, 12 Sep 2026 12:33:15 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:47::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm5938278eaf.1.2026.09.12.12.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 12:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 12:33:13 -0700
Message-Id: <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com>
Cc: "Paul Moore" <paul@paul-moore.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <matt@bobrowski.net>, <mic@digikod.net>, <viro@zeniv.linux.org.uk>,
 <brauner@kernel.org>, <kees@kernel.org>, <casey@schaufler-ca.com>,
 <gnoack@google.com>, <jack@suse.cz>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <martin.lau@linux.dev>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <jolsa@kernel.org>, <m@maowtm.org>,
 <bpf@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 04/15] lsm: Add the bpf_lsm_policy_release
 kfunc and policy object destructor
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Justin Suess" <utilityemal77@gmail.com>
X-Mailer: aerc
References: <20260909193719.518517-1-utilityemal77@gmail.com>
 <20260909193719.518517-5-utilityemal77@gmail.com>
 <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
 <aqHUw6k0Mf83CGFT@zenbox>
 <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
 <DLD0VQ3D8CYC.3V5ZT8HDMY4IH@gmail.com> <aqTZdCz6JaoK16Fp@zenbox>
In-Reply-To: <aqTZdCz6JaoK16Fp@zenbox>

On Fri Sep 11, 2026 at 10:26 PM PDT, Justin Suess wrote:
>
> If fs/, mm/, drivers/, net/, are permitted to have kfuncs, then why not
> security/? kfuncs.rst doesn't seem to forbid this.

because fs, mm, net see the value in bpf. bpf helps these subsytems
to focus on their core technologies and moves policy decisions out of
kernel and into bpf.
while lsm people treat bpf as arch-enemy.
kfuncs are not stable. we keep refactoring them.
while lsm folks treat anything within *lsm* and *security* as stable apis.
So any kfunc where they have a say, will become a huge burden for further
bpf development.

> Where would you point me to?

landlock was designed for unprivileged users. bpf needs CAP_BPF.
There is a fundamental disconnect. If you can tolerate CAP_BPF then
just use bpf-lsm and implement whatever policy you need there.
If bpf-lsm is missing a feature we can fix that.

selinux/landlock shouldn't be calling into bpf
and bpf shouldn't be calling into selinux/landlock internals.

