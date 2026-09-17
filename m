Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A1C3859D7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611867; cv=none; b=tLS+5cR54pt2PpVXtGKZOQkpevoCPJYVJxKC+wmjt93AxDG1ocar/MerYm20AmX8K7XGjrCEvUP4rs+Zh79ugf5IBMXzYgF2zjVWgk4rtizYrMgryyWJVSAP/VfQUxGoPOad6tvUmETvfy6dV9LuajA1/Zx1X4bHSeQskOqGNy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611867; c=relaxed/simple;
	bh=E+msnkVkMuv7EW3/XyJSZb0DiTqaEOW4e8lxU2bUdDk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=WHtlHNkGHPbNUhMXtVI0BBEnKP8ObdBpjXBXeiYhwATyu0orihaKiUyqtCFSAVJrsxFEkESwawtAWWiLfIlEbZbNoZAK4hSskQEQkzyDcXZ81REZwe1dp9Ge7W+cYfFTrTLtpRPeAsIqTFKtKxsh3iWnuqx6jIhJN83UavYgrKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfozeCmU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfozeCmU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fdc579daso3411755ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611865; x=1790216665; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6EKmqByiGxzJPh+0Mll6vjXYdVK/vy8pIRVPNPfe0KQ=;
        b=DfozeCmU42c3ZQt6zeu2eLYJawKiY6mKFmktJGlatz7kS0KtK38o/GFcK0d5SnwSzg
         Mjdec2QO6eboPe2Jz4IkKLjF/iIv0aBkjdGl8vvrUkCEtctay+UHUKqR9DVS+y+KVpob
         tncm79dXTOTPcDu9g9fjUDBbfMrrWN2AQ9kgDGSwv2d3BckJdz4kWNueJQrwT2QE+PI7
         EH8vqv5Tjnq6dBxaNOQhZeBpEqZcgXhQglEoY7nbKJDPfzEdiS0Zrafzhhq6OdQYBxWH
         dbUC21FZJB4V4N6W5UsLx6JZ1N41Q/dd4w4rYK3UVq+xlao0i/8nLQZPfdyxgebsGQDe
         YxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611865; x=1790216665;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EKmqByiGxzJPh+0Mll6vjXYdVK/vy8pIRVPNPfe0KQ=;
        b=P09IfizHYHmZJSJF1cDLkfsu2kScqF6ivpL6095Ok9jr3g4rGsU4DDhhaB+a8dr2H8
         J+5C8obzRyB5H2NT/XFCQRMjMv2/H5XXmBScv8sE4LnQT+f8qBmQ8IdWs1LZPOfknbIm
         h4pmVkaBaBBh52VZgWU7HjUJC0Nmbxqk5foTuf8EjdRm1/kALD6MrDaXC89E0nOv5Lto
         yHIukBH8DHBbnF/wnYXYKjEgWoJp1AEt0oMt5kry0GglyjUlWE7kyxYRjXBrnfBpWsb2
         73XzyVFzurFG6FS9+qSWdMHCCqlumXAJ0PPXhrgufEe+cY7a+bWzqNqMnwHxxwWLFSOQ
         JBJg==
X-Forwarded-Encrypted: i=1; AKwUvBws6SF2UOtMPe8Mb4u+5eUlsoJ3q9GC6S9/pPpp2OemiQ6DF7tnsdlicLy+1avte3FTB8CfNNeHnhMp4sQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgENSug48RgCx+PWm6T9cYJSHqyosvRk1Udk+fHlt4Vzqggjuc
	LidbgZFV6v5SCaGD5/BpWo+mF1nceXovTp9/FCxWo4+pE5pXnJpAIh05
X-Gm-Gg: AYBFou1MkG78FiqdXbD/YVc6ZUB4ff4MyyVlnlF2CzQCR6oyahK668wcjkxF9p5TztV
	H7burMRrHc4r4WVeZg7Cmex7hw9qEH2dA7BadlfGCB+xQ2LRf4Y2abdqRiVmrqkzxMlnLVNDBcr
	xEJbUxtKG9Bj/yAFQ40bJteX+CxzRlSSah78O2NlvNeYyuCHSpC76R8BqbH4L1UxpbjJLKgvazn
	2x+J74ghoprRBlPbMnTXbo/8/iqk9YDKhci/FVUEoeuM6LLoU1Jy4xGa12ijcBFDTERCX5+mAb2
	IIKQka6U7fvT8MCNr2ypzQJ6xGcJbkcePr6xmTNoky9xmbzYhy5/wA2guCYOqfml97CI1qBVLBb
	94PXujSlP9ICKAhIdXh/AuvM25KmCgS5z6bkXvgENdWofSf/lgDVbqlNPsZePqQuVOhcgH5hY6F
	7rqA+qA0E0LLFdDowF/3Z/vdMx3wc1cnyEH/xoZr0I1gDP08XhkRy6ND1QUKF64z4APwAQh2LJR
	ALOFZQzpTHXH/6utxDVIheYk2mUtJwoEPBZi+TIkueqm7pmE+BJXqBg2tPULedwivRxWMFYvsCL
	WCO6
X-Received: by 2002:a17:903:1ac7:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd8e3f57f8mr114351815ad.13.1789611865419;
        Wed, 16 Sep 2026 19:24:25 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ee3557sm18694235ad.52.2026.09.16.19.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 19:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 02:24:24 +0000
Message-Id: <DLH8GKM4B06Y.3HTSEM5YGFR5D@gmail.com>
To: "Josef Bacik" <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <x86@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Josh Triplett" <josh@joshtriplett.org>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross" <jgross@suse.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v3 06/13] bpf: Take a Tasks Trace reader in the
 trampoline glue
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-6-0ad30c4c5ee7@toxicpanda.com> <DLGFJY2ZSY5M.11K7HK2CLM6I9@gmail.com> <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>
In-Reply-To: <a51c15af0d61414aa780e7646b8e74cd.josef@toxicpanda.com>

On Thu Sep 17, 2026 at 1:16 AM UTC, Josef Bacik wrote:
> On Wed, 16 Sep 2026 03:45:16 +0000, Alexei Starovoitov wrote:
> > On Tue Sep 15, 2026 at 1:17 PM UTC, Josef Bacik wrote:
> > >  	__acquires(RCU)
> > >  {
> > > +	bpf_tramp_read_lock_trace();
> > >  	rcu_read_lock_dont_migrate();
> >
> > This is double increment. rcu_read_lock_dont_migrate() includes
> > rcu_read_lock_trace().
>
> Unless I'm looking at the wrong tree it doesn't, on Linus' master and on
> bpf-next it is
>
> 	static __always_inline void rcu_read_lock_dont_migrate(void)
> 	{
> 		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> 			migrate_disable();
> 		rcu_read_lock();
> 	}
>
> so plain RCU plus migrate_disable(), no Tasks Trace reader. That is why
> the non-sleepable glue needs one added here: on these architectures the
> trampoline image the glue returns into is only kept alive by Tasks RCU
> while the task is a rcu_read_lock_trace() reader, and rcu_read_lock()
> does not give us that.

Right. I got confused. Since rcu_read_lock_trace() CS will cover
both sleepable and non-sleepable prog types let's do it once
per fentry+fmod_ret region and 2nd time for fexit region.

We probably don't want to hold it for the whole trampoline,
since orig_call will delay freeing of progs.
