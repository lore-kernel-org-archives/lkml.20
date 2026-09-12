Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710A3515C7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789247645; cv=none; b=csLLh6uMdBAgs9IYS5cPVU+vhOkCSWyuqQ5HDKx+0iqPyevMpqTIuoHWDCwSNCWgd375Kp6WCLD7+4J5jko3VwLG+kDHekWSIv1waTplvwvrgVaLrfFW86oB8uxAz4OVtJydyzZahXd8Z2ieJyvLAMlcV/s1oQQTvuSpAAb7+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789247645; c=relaxed/simple;
	bh=+aDuxa4ipJlMz1JaxCLfhKnz1rTsjziNdNYQxmJYJ7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=US7LYIl/UcPva3lYe/pioJ4e67Kv/fLA7yQ8+CzGwPdAkMVMsm3spSfj+34TpK+ERv47AppLp/ZOhGr2HtL+aNtsOfYh7EwjvDDddv72nGolFcjQNBN0oyaakxgt6r9g3QxW3pltjenExejMT5Ezu0+MkEXPwU0VdUupvw9R2YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUALi5ON; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUALi5ON"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4858303de5dso2087857f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789247642; x=1789852442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RN6NlWXNxbscB16yrp/7Xyb7tbAGCIZghMiPDdHQJK4=;
        b=pUALi5ON86yZWWJyWkB1mt6oSZxlDCbQgn9I+Vco8t+HbaOSkeIO1VwjgzqD7aQh3f
         OYZ7xp3pP6LdiubLFn+WuZpmS8kn9REQ1qX8nyeTjQ9KYwaQb/9cFs6VygZG6uZa8b1H
         gaaleLq8U/XbC5np1icH0ckgK043LVZhky/3aW/O5JWixxpheYCoRVoW0fhWF+EKkKhY
         vGINxwsh4gaX7tullJQbxgkBmtMSE+tRQ8jhSzw4/Ri8hUJjLs+Ewoo1fMbubxus0qLO
         1qC216/sY4X7yEkFQf34vPRzxIq8yIGLnw98LsMCodpdQvU9cM9LnSviYY8aHWhiosDd
         VRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789247642; x=1789852442;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN6NlWXNxbscB16yrp/7Xyb7tbAGCIZghMiPDdHQJK4=;
        b=K4OIBJoTsh0NNxtPBxNQbnIfMObc/DTCDddW8XT+Dz/ivKIDjCdpiU+db8wxk8Bd0h
         fG41b0Qja4rvRAtGFiIiGh4E48ZtKUJEhsZKYWFvDadRExJ5MmEd9BhOb3HHOZX9IO1I
         SGHWxg2dR2rwddx+iUgF8HhuKM5TEtDAxoeSLrcyG/DtRulEGJNKjkIDXpgBH6k6RLaz
         Mw6X3Zr3Rdlfmsum1hpsUvqdGRW8gOc6TfKPwPSp94K9jsf6RInunNs5Ta7o8ezH1rbO
         rhHUTXLVKZy+lrS4As+qzP8IILIOS5LArHCW22Yy5QkbPRaHzi4ugHf+q+QkBDwpHRUD
         aSDA==
X-Forwarded-Encrypted: i=1; AKwUvBzfPBxh25IY9NMi4I7CmTy9nN9YxHFq1afHSrQSJ7L6APkJ6gCkcZYBBknMJcQdZQHFTXJ8HxUyOENAYDo=@vger.kernel.org
X-Gm-Message-State: AFuF++lM9913PbRLJNO8iWZ9zKmKbSDV+qx3uYtOSuifLa1T2LE6hE6U
	0FE8nf94gQeE14Sh56IDniUTELyr2b66uQqX2AyQTvnAX4OhX+HnvNTC
X-Gm-Gg: AYBFou1efAUUiLfg6WJ2AY77guaFvzq5cOJ4EN6iz1rKLUbD/c/ZPFO06zojvtfd1UA
	N68V6v985SdZKJ4vX4h5wZarT1JhGopn7LYatdCdIqcz3yyn5hAllXju81TCbba2arThmRT5qf/
	ND5jTrHtsiTljCBU/zWuO+o6vqjvYJfZSr6t1jjqaLaPxO53C4OH8k9IZn27D9bHiThEez+CFmh
	OI2iBERikXprOTE9IdpWJIONuH4Z6K0qVSopp+PpUwSq49CjedCpxCP06exGsFp4f3j8O2Dp+rz
	22KxMhA+qoIaM/W6wNzY/aVMjYA2NDemapH5r0IW5QiT8VbW0vzVkVBY2X471LC1t9YQ2+oZnJk
	3Dpbprw87jKpSgvAePLDujODRBa4kp7tT5hv9ieKAKUJqEt+h5WtxGMcD/owitmQ+z+C4T4gtr0
	zwF94FbkZYJbxFjWobyTWS2r/PTezqYibEDUiJSwflb0ZjhWcsk/t8MKOMmAMJxrnMeKlJbUbJu
	jF33+OcMNhwC66NYpCvfFejRBjj6doXL9GA
X-Received: by 2002:a05:600c:3513:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49e619d479emr105307385e9.29.1789247641902;
        Sat, 12 Sep 2026 14:14:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm240080175e9.10.2026.09.12.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 14:14:01 -0700 (PDT)
Date: Sat, 12 Sep 2026 22:14:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Josef Bacik
 <josef@toxicpanda.com>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, x86@kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Andy
 Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <20260912221400.4045198b@pumpkin>
In-Reply-To: <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
	<20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
	<DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
	<14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
	<DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
	<8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Sep 2026 11:03:34 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> In the old kernels, yes, we have current->trc_reader_nesting++.
> In the newer kernels, Tasks Trace RCU is instead implemented in terms
> of SRCU-fast, which instead increments per-CPU counters.  Which among
> other thins is a bit faster and does not need to hook into the scheduler.

Isn't that rather architecture dependant?
It is fine on x86, but on arm incrementing a per-cpu variable is
significantly expensive.

David
