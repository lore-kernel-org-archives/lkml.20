Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7D47C0F2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861344; cv=none; b=Qrq9sVuAQS/MG4pl2DEMyvVO5h16z7qQ0LIPGuYg3Rn5N4HCieC2ReOarx9BBN1Nip0VqSOBA5RRTpckKhG2GjJTlaCMhlIPskyu/rBzFs+diulvOvTQP2OcIOFGUa5BR1tt5RfbHkP2/DNPHvXK9g+IQqU5dtdGbCMUjHCYar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861344; c=relaxed/simple;
	bh=W5Z61Nq5ztKiixSzOg/KI+CWrMFLg5vyI2wky8v9fwc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=M+JlF8F6x7jka9OCyQ56V6Q1Xw+YBlt38ahhGeih5UK0qBVJO/4UHdO5UoLa2Ez2xH082ToVZ4qGUBPgeim6IA4aFj8NImi45hDu+YkhRkvgLz4DQsgH+rs3DSYtHK4OLHSsj/RhfwO3nPCSRhKCT/TIgdT5s10ZzAROLQTOXC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+dPQ6Ip; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+dPQ6Ip"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so230844a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861343; x=1791466143; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41trAFy/D/tRuSshg4paU2rmIdPH/gR2P5hv3iAAWQ4=;
        b=p+dPQ6IphpwIxRgcwWEZEA2sA7DrF0VLrDqOYBO8qziVvYdxIuDfAyjWtp8Wa9RPqM
         KH4q4SAzVOMaj+JRkfrXeb71FkAekMj4+IcaWrp7Qnf/5WPlWy4L6VItMpzzO0GYIe3d
         4nl2tUjcjHnqlqpowD1oIU2/TaAGgklhtV1q8DeoeTULFaAAcS2YyDFCEd8vpRVt5ONU
         xOaMV1iXUneSZGBacoaiWxG7UPP9vlJstglZNnNgBVfSeCU3YTVs2OcS0RpRoYyFSvCQ
         Ia8kJ52zq2rof+1MaM4VJEjWsIXCuZc+x/8AQwLpXax4YYICLyvGL1o1fYi7FUzcgJF0
         BPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861343; x=1791466143;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41trAFy/D/tRuSshg4paU2rmIdPH/gR2P5hv3iAAWQ4=;
        b=TlsIOW4mxaX+xOoJJQN8ZoVDVFyTNUo3/yGUhr/mRIX+dvddS9Yh96qMI87+FweCVp
         H3lgPIILudXX1D3yAgk08weGU7gbqMukG5p6rxDFa8rDgC1Cu2hdTwdHta/hwL9b2IDK
         +2P4E7OuUBw7o8Wu41q3ZeQ7GHf6bQVHgnVSPlE3iDgp/WEbrtJfkYTL/2HEBoMONm1M
         t/tcvVERVQe8TT6nlGfKzadp99NsKflzFeXaJxe5t7eCJ9YTeRmJSwHBIWKiYAWKTD78
         +FYWzpg0Y2jRPQC8f1AfWzJPnW9+5INlYnLTXazG/M7t3ubRQrnjtoyFXET/ViW4R6k2
         KjjQ==
X-Forwarded-Encrypted: i=1; AKwUvByMiMAT1xTyDucAqdtc+JPd8qtVXnvlT84hoEAYyAgs85pxapXpwXLFzpypLM9XybSoeqNQhTNVTv0Lu3k=@vger.kernel.org
X-Gm-Message-State: AFuF++lqpeyCFaloO5S2IW2sFM/skfA8dlC8C1ZlYBMmw4xOpCp0Mu/H
	Krk7b5klyeoyt8iYJZHnl95jC2zn65lK7zGq1GSci0XZeHMogsA0tsn7
X-Gm-Gg: AYBFou0zG/T4/yYB02tZkyBIgNII/cbkRxiZr7Q1LSTc3sasbQZD1iZKeCJ8ugx9xzF
	7qqG2M7nVBgVOUtqbWEUTPmt08SOfgfYLA/yjW7YJ1uW5tVxUdqzvFu26cK6aO7eJn1gBGntElq
	MAKZ2hBEuisCd326b3vdFibJYY6sn/iVPN5hDclvjQS+27hfCGN27UGI+8sB8jOP3LBXFaz4RWm
	NeAbMQIMt7kSQIICD1A5g2PbLiAyocKiXeTnCjaj+SyEf7TAinnLZgfRvmlhVBwToIA/wl145B/
	Hfq8hzEDOBXIUOkJOBBaqrsTwaeLes7ximt4SScOnoWsyaHz6C9p7YNapoGke5lHictixPnQOBL
	Y3YJNoQ0EteD0ztkejFLYxElNH9gHewcEwaVl0E6csy/gUmi6hziQxLoNyPFjv0YOWIYUvftnfR
	WjRYMNuvMipkkdoIQhaB/+jShsKaJRtwpDlqwUU88kG34DPdQrXppaq6+jt431THXP2gWCpuEKn
	tHbnJ84IXoNI/ZNnkAYUmRQ5op+nJZn1Y5gyf/UzOy20CFjFc0ffivAweF9ySjPSvW1OaDi9qMB
	32izD+uZ0u47rg==
X-Received: by 2002:a05:6a21:748e:b0:3dd:a9a9:396d with SMTP id adf61e73a8af0-3deace089c9mr2562419637.49.1790861342684;
        Thu, 01 Oct 2026 06:29:02 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e5285aa8sm1549511a12.0.2026.10.01.06.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:29:02 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 13:29:01 +0000
Message-Id: <DLTJD2PTJ81W.FWH9UA1B59MR@gmail.com>
Cc: "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Amery Hung" <ameryhung@gmail.com>,
 "Tejun Heo" <tj@kernel.org>, "Meta kernel team" <kernel-team@meta.com>,
 <cgroups@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Yafang Shao" <laoar.shao@gmail.com>
Subject: Re: [PATCH] bpf, cgroup: fix cgroup struct_ops query for a second
 attach type
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Shakeel Butt" <shakeel.butt@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>
In-Reply-To: <20260930135159.3926039-1-shakeel.butt@linux.dev>
References: <20260930135159.3926039-1-shakeel.butt@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 06:51 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
> +#define cgroup_bpf_enabled_runtime(atype) \
> +	static_key_enabled(&cgroup_bpf_enabled_key[atype])

[...]

> @@ -1448,7 +1449,7 @@ static int __cgroup_bpf_query(struct cgroup *cgrp, const union bpf_attr *attr,
>  			return -ENOENT;
>  		from_atype = to_atype = atype;
>  		flags = 0;
> -		if (!cgroup_bpf_enabled(atype))
> +		if (!cgroup_bpf_enabled_runtime(atype))
>  			goto skip_count;

No need for a new macro.
When the key is off nothing is attached, so progs[atype] and
effective[atype] are empty and the loop below leaves total_cnt at 0.
All other attach types go through that loop without such check.
Just drop the check and the skip_count label.

pw-bot: cr
