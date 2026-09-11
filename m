Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D180B4BEE24
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169051; cv=none; b=jsl6yIYrt7notu/6fdpVlg/JClPtH+nh7sNSvSniajrDR/zcw6l1GR4FsD08ksB8hJUnKux9YYDnqP+7JYSSS8Ofy1SDQ52iWz6d5M6O30XMuYG1RJmM4wYNY0oRGqoipokxCMVdOIYzl5TYgLWHXjbFxMgIKAIlR8JVP9YluKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169051; c=relaxed/simple;
	bh=OLxzEF5Veo4HgAXDo4DPwZqpxPXhOc+Zuv+WgZ7fy0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7aFxB3utcItxTGmdxT224l/xRTdeZEC6pMwnqOm20ZPgkbaT2uayuoQwFHCB1FXqJ3ct+BISbpYl3ZOOfiE4VG0DhBeIqhcQEy8jdgwVHjmNBcGvmPXXbmDbU/s8kZKyIclN89XFbBUdCTPHCw2CPpGB2msOZy02Q9wAtnQMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XCA21cqz; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XCA21cqz"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff3aca06so11025ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789169049; x=1789773849; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLYK1uyd6czX8B16m6xbBDxNBXBkc9fwokq20u5lm6s=;
        b=XCA21cqzbEXIz1lbmeDPhVHhX87amOYnDicHzEYpvZb5vV/XWKbHFaY2ZSEL8Ze/rz
         rbtF6W5F2fzefCj1iyxp0dG15HXVyhwAuj3MDukthrh43dIpFwZB2n7Jv9NcK995gX/t
         UzqoUN3IY+5n78KURFsJNOJ+CRxzujg03ZGAkz4d+Jj39TkT5RNPzys9tsQnNVhO6Gmn
         HSMklH8jX28xvLcznPfXHJPMTXBqQYlgzdq9wmvQETamtsumCwgoSNu3ZBuK+9h4WcP7
         6senII5cUNCe7uJt6g67mu46m6MJqHukFfIuRDN/nXsaWkd6BDdxtpGvbtxufE95fO/T
         IQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169049; x=1789773849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wLYK1uyd6czX8B16m6xbBDxNBXBkc9fwokq20u5lm6s=;
        b=Oj07gRikncZ3o4/Of1neE/Ex8JBCbGlqcH8VgvtCkmUdk2fbcll/gvC6qSLDm0eVjM
         wW/acYMCV1s46PxMeiOeQpINjZm6U2/saiYggGtSUiDEprWK8bsv9EquDic3IYv8YB2+
         9QK/7IGfxmT5vs8aRNsdrkKH5LdjBSe9s/vW4p6v0thQ5tFmEzgT5mwMmKhHsGdYSEbi
         GiOzpgnm2G4ChLg7bOVdcWz4ariTuqCt3uf8ZLtGFft025tR+sqbZ9a9iuTaYkPDvs9f
         vGLsFGJUU/vxDQenXzyJwQFsliFeA32yY/vrjnKi+p3yQwPcrQ8bSCS7OxFssYtMkfz0
         q4TA==
X-Forwarded-Encrypted: i=1; AKwUvBzR6KPRjhHN98B3rN27viSFcPgn7zmM1iS9S7RpfC+zRdfsGJsO7sSQfyTreKI3mm2mEt/KetT9qcV8irU=@vger.kernel.org
X-Gm-Message-State: AFuF++nZa57IyhAoQLMT38xsZKXMISft/I4GmlqfJFYOHza/cE9FO1aO
	gprr9A18t5UUbPYWJ7jZ2ULVsDRgLYZRsSYbVpLdnO1g8wKqaPBhs4+988BRfDy58A==
X-Gm-Gg: AYBFou17bI3pjqVvhGfup3j+recc9MsVgQyWggePie1ftpFhkO4E0HaOJP6MFGKzhy6
	9FhMiaJYck8ZJtXp5a0apVpveBqspVrgWXntOO7+r1M7+koLd/nXAwY1l8RgT72K2I31jfyNqUt
	lNoGAcWn72eX7jRyUZWvH68fLfsPAT4YhFeF7SmHa050u8074YH7ZghT8JJu7otkPZHmDCJZB0/
	bEt4J7vQsCxmqMuejWdjDcHXQViUnMyT+u0vZ8gIHYll16iL+GXSBAq+kaGzffJC+Wc58Wbd39T
	TprpwjcxVQuLDz6W8Rj4REUYUIo06vsCB+qOsoeArFOFT5zm7ZuHwCXHakkBP/5GELJOdm8WPEw
	nqUHX7VOkqRm5LGQ7fySv5+kEWHOnBBegVYNzDtDosmDiI8bRpYDlcv/HmCM6eYqnd5zbb/sE+v
	WUAWOwiuuamlArhfeh1qFReJ60W17LVuyI/V4PHMzRTpl9MEtJXPem1yv1kOrqWfzFaitMscBtt
	1Ue9nUVOt5gcZqRthJ6pwNX5pXy/Vf+lmoRRzo=
X-Received: by 2002:a17:903:2309:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2dd47eceefcmr3132765ad.2.1789169048773;
        Fri, 11 Sep 2026 16:24:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:5f1c:c62:bce3:653f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm9050841eec.6.2026.09.11.16.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:24:08 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:24:01 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: =?utf-8?B?6auY57+U?= <gaoxiang17@xiaomi.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Xiang Gao <gxxa03070307@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?utf-8?B?5Y2w6Zev?= <yinchuang1@xiaomi.com>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Lorenzo Stoakes (Arm)" <ljs@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [External Mail]Re: [RFC] bpf: account ring buffer backing pages
 separately from Lost RAM
Message-ID: <aqSNkbhIuaB5D0H0@google.com>
References: <20260815091819.3651099-1-gaoxiang17@xiaomi.com>
 <04f3ce2f-67f5-4829-9551-a69b9df29854@kernel.org>
 <CAEf4BzbwZkoacX-iP1j4+p8YNbWsq0pc3eTermh2uT5ir66zbw@mail.gmail.com>
 <8d2e20842c24460296e4c83e6dc0dde3@xiaomi.com>
 <CAEf4BzYQvhSVN=Hggg5FHzFdkRr4UNBD6yXaBsOaAwbsRpXpsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzYQvhSVN=Hggg5FHzFdkRr4UNBD6yXaBsOaAwbsRpXpsw@mail.gmail.com>

On Wed, Aug 19, 2026 at 10:24:28AM -0700, Andrii Nakryiko wrote:
> On Tue, Aug 18, 2026 at 6:46 AM 高翔 <gaoxiang17@xiaomi.com> wrote:
> >
> > Thanks for the pointer. Understood — no new NR_* counter or
> > /proc/meminfo entry.
> >
> >
> > The remaining question is on the consumer side: Android's Lost RAM
> > accounting would need to enumerate all live BPF ringbuf maps
> > (BPF_MAP_GET_NEXT_ID) and read each map's fdinfo memlock to sum them.
> >
> 
> For BPF ringbufs specifically, you should be fine just iterating all
> map with BPF_MAP_GET_NEXT_ID, getting its FD with
> BPF_BTF_GET_FD_BY_ID, and then passing that fd to
> BPF_OBJ_GET_INFO_BY_FD to get map's size.
> 
Hi Andrii,

Thanks for the suggestion on this! I did want to express a couple of
concerns with this:

Scalability

I counted the number of maps on one of our devices, and there are 112
maps, meaning that there will be between 224-336 syscalls with this
approach. eBPF is becoming more popular, so I'm concerned about how well
this will scale, if we have to invoke 2-3 syscalls per map.

I had a test program that implemented your suggestion, and it took about
2 ms to identify 39/112 ringbufs. As the number of maps in the system
grows, I'm concerned that the latency associated with computing the
memory usage from ringbufs will become even more expensive. This is
something we had an issue with before on Android, where we had to
iterate through various sysfs files to gather wakeupsource metrics [1].

To improve on this, I was wondering if we could expose the ringbuf
memory usage and potentially other bpf stats through bpffs
(/sys/fs/bpf/stats)? This counter could be a lightweight counter that is
incremented/decremented on ringbuf allocation/freeing so that when it is
read, there aren't any expensive computations.

For this specific metric, we could just use a counter to track how much
memory is being used by ringbufs and have userspace read that. That also
brings me to my next point.

Correctness

The max_entries value is the size of the data in the ringbufs.
However, it doesn't capture the 3 metadata pages associated with each
ringbuf, which leaves a gap of ~468 KB, and that gap can keep growing
as the number of ringbufs increases. It's important to have as much
information as to where memory is being allocated to, as there are
devices with as little as 2 GB of memory that we need to be able to
profile memory usage with.

I think exposing the sum of ringbuf data + metadata pages through the
node I proposed earlier would help achieve this.

[1] https://lore.kernel.org/all/20260511174559.659782-1-wusamuel@google.com/

Thanks,
Isaac
