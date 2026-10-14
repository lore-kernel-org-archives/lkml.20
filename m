Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44149363E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014234; cv=none; b=TcYKWBUrK/SbJ0lC3ImBQ7lb0BvcA62HOoFxV4JUp6Sc0gKTNm5RmHndmsrkrdbHN22yULf1uM2meaYapT/ZQC01p9Yd89qx8nH7IVuAqTeqByI1PN8PcGEsn845d66h75Z5viiV4Te3YO3jeTPD7ZfFQabLVs9SJW6PcAW2p3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014234; c=relaxed/simple;
	bh=EtI4ggX6siZdDxX9QVbhUXdUUm5AbMI5AMTmaI9v0aE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUDL8aqcdqkQaLook0q/vkFrmY28WgPvVBNoY4vURhHceX4ewX6h5lJZ4AO/zjXnjJCpdq8m6bCmeTKOfRlJIrEB+FiizFbaTnrrKze7umYDB0IxHiAN8zlCJUiUP6btvd+iyntia2SKLEBWy1jHRmtoIxYrqCcMzzDll+IXPjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcOmMhs5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcOmMhs5"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48de72fc832so745744f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014231; x=1792619031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8tvaxXme3A+GDB6mr5zX35hOYWPVi2nagWE6JeKbsfg=;
        b=GcOmMhs5w4i7JvGV6NVgmD99o62uNFPFKbnY3cxij55UKVRb3igVj9Z0wpJpDUQya8
         csg8cJRJ9zGgHChl+8ssUEa6AiVVOTQRkeIyiOl2iXel95aApeq9BCWKtIUtnX1ywGSy
         5FS3Sx2prEye6NwGo32GBgO4ZL2H3ApJOdXz1g4RlcV3tuPbfoSuZX90XhZnliJYBsF9
         cRStg173NunbpLtSm1KsIkDvbNaRrTpLcrwZNVrIn+SrAq50CP9Y9bLOtpyTlI/0FY/5
         qI0ltlP91IT0rP/65aVLV3z6dxlDz3H9EmFrC7FsDmqwwiBqIWtXdywq4SEyfd8zSN2l
         MSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014231; x=1792619031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tvaxXme3A+GDB6mr5zX35hOYWPVi2nagWE6JeKbsfg=;
        b=gDUY/ytrefGCep19lrNK1tJUnfUDDHCh87DQxUnoPKcyseZtjT9fvQsct7wecKmK7Y
         V4PnYbPFjGv6lSqClJ/qSX0uNuHMDHEHlZZH6HU1QyLKcTM37/7FS2gvhq/eqHs/odJh
         rIsEKHVJNwsIAFI52Bj13/qkFNMosS/l7etXkC/c3QRjnQnlase1JXE1yXfS8WylR7s0
         UFZYoUC5GxNALxbh1uDTPlY1ZkKwyfN5IR7j5bvyVcPTEktIqz1bbB8ThAv49lgkCY0s
         AuzJBl9qedooe6jKq3x6RJCwnvGndWWBSJ1pJ2r1AJiCEEaOaPLCztYRutOPwQsVtw5Z
         q8jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYkT+BdS/7WoIycNT0VhX6E3s0mlb/gT8zV09GL8kFE5Ez8eQQZWcfRHx3U97xbhoBe6v7gQi/DKJDLgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH9bj64W4fhLgZzDFYFz9h1NoC3T550YuRht+oMRmZGVQA8m8N
	st8r/EiPPKgBrgTFu1HgsRpq3VVFRM4O2lNMks7Hv1xh12Yxa24wSOKW
X-Gm-Gg: AYBFou2cKLvMA4cjtBXS6fv/KxqLVtC7wPXiXB3YqaqYol25IqpI+zYV+a9BOKK6vVd
	WtLkTJo4e+cIVAhpsNA2wUloHibZFnfPGIq0t2f/7Bb+z3YyWvUy2ZlArI+LgbbRyDBUWvfUyMb
	pGRRvktcaMHxhl+T/IsOX6SCP8KOK1AQ2VnP26GhhkX3/8dp5vpzjZVdmzMFj/yKlB92vmH+dYM
	j+cjiT7GW7j8LVxyJNQaOVrveDmYgHxbeajSHoZ3DIlu0TivBgAPi/SE110632nIAmtS/pBcfUt
	a2hn/2PGWCb8TJE8Tsgu3f+0+vYS0VnuvpJYpVwd/XqnKYJMu5j+S2Q54gPz5IAijq1Q3btK1vE
	MSWsdLGIdRIDhD8Q8C28dPgc864o+ESz2HQzZfdxXH41sRFiBF27DwvSxlfQmGLum6Qwrsvr04J
	fr0+6Gkm6+5xxvfHX2kTrdbiGvhs9JYsZi8y79fg5TV834aYOGllnuiPxHsA==
X-Received: by 2002:a05:6000:2686:b0:48d:f3f8:f910 with SMTP id ffacd0b85a97d-48df3f8f995mr500636f8f.34.1792014231493;
        Wed, 14 Oct 2026 14:43:51 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df2619703sm1681492f8f.24.2026.10.14.14.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:43:51 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Oct 2026 23:43:48 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Avinash Duduskar <avinash.duduskar@gmail.com>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>,
	Rong Tao <rongtao@cestc.cn>, Eyal Birger <eyal.birger@gmail.com>,
	Pu Lehui <pulehui@huawei.com>, Jingguo Tan <tanjingguo@huawei.com>,
	Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 14/21] bpf: Add tracing_multi link info
 support for bpf progs
Message-ID: <as_3lHuqBSVQMiB5@krava>
References: <20261012154024.29423-1-leon.hwang@linux.dev>
 <20261012154024.29423-15-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154024.29423-15-leon.hwang@linux.dev>

On Mon, Oct 12, 2026 at 11:40:16PM +0800, Leon Hwang wrote:
> Show bpf prog info in the link info.
> 
> $ bpftool link
> 9: tracing_multi  prog 25
> 	attach_type trace_fsession_multi  btf_obj_id 1  count 2
> 	prog_id          func_btf_id      addr             cookie           func [module]
> 	21               4                ffffffffc080064c 16706819         target_1 [bpf]
> 	22               5                ffffffffc08006d4 16706819         target_2 [bpf]
> 	pids test_progs(98)
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/uapi/linux/bpf.h       |  7 +++-
>  kernel/trace/bpf_trace.c       | 26 ++++++++++----
>  tools/bpf/bpftool/link.c       | 63 +++++++++++++++++++++++++++-------

I think you should split the bpftool change into separate patch

jirka
