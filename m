Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9934EF1F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790407915; cv=none; b=XWo2/YMVKbyCACy1C6Vxy7Ax0mt+b2+94pOGzV5T05lOjXGoHAMzwtwUESQMOxIl1f4gZXFl/4nDktfBIO9Kxd3kw2peKEpqdSFBttpYElsr5fRomBLpyG3bYO4HFbaYEJJ3y9l045LqcCY4NAfnoz8GkX4VXq07C61NUD5s15E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790407915; c=relaxed/simple;
	bh=kzU8QNWm28e2y70xXRJErhWUPUtjovS2IQKpU+gp4tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QV5C1NO1r8a5TlSH6P7wBAfGIMHGuEYgfEMXYa37D2wLGfcl/SJKf+9BFSgrbK7KZT4eixYsYuNKir/7UBGCz8prSBlMyi3CKqv/+fqIU6kBXF9+RWFjvEKXpw+wf2CglxB0cwb1BVSH7HxC88UUmO6lAjkDN6ymkQllleIIGrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smQxpmTb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smQxpmTb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71974de4so922645e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790407912; x=1791012712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkvDHiMHE95iZAf8lTowG72tJREbCH/YatR07v+AyBo=;
        b=smQxpmTbpnHEyouNNbn8fPqFph9iroQCrpJ3A+18pARzvTOU07uGilo298BZ8CuxbT
         CPoTJZWz2J1sLjXC7kWyFcoyWYii0Mu6UsZnaFObQS1dU9kKs6kV+dFRarNQe0Mk7Zwe
         9X1IGHDBrzhvmP3bYOdwQoH2rO5zEC6IV2oDRVVM1lnKzwv/n6OjqwFLAMoWYVNIShaK
         1xB7bWc2LFIBKJjRAEkmFjlpN1dpSVd0jQ4GU8jMAyVpUclwW/8tFXnBuKKtJ97vbJzd
         mkxftbhBGnNDDUn6xMWI0S9hY285thCe1KPeAMfyl4wL11Af3wK+qp/kS+kerhZZnG1K
         fgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790407912; x=1791012712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkvDHiMHE95iZAf8lTowG72tJREbCH/YatR07v+AyBo=;
        b=AGg7nEsW/FvkZsgY+HQ/rlK0Z3GjxzDaaPdVz6Y31jCrT1oop9+J/dxxIQWJnrbvKG
         qetY0OhdaDcUQ3ySVlX7HuoJqUY4G3iy7PO2Sp4oEql06CTiuWFtb/pSdRJF3LmMZPHE
         cTPWsv6drFQbolNEDdcTvY5IqfJ3AElN4kOxrNT0zV4dHgnphWY5CqHQ9qf1uSxEgFMN
         cyiZ8oElSEtvmlCJTnqMVXfWz1Otxwgpz9obB/8L1BDOu8QeuJCDv0Xoco15wuNjNkG/
         bfYW+i8b5CVxk2QO43Migp4r0WzYPK+tBNkjiyucdwVC4SSp2rsit/wVuY9+t2z6rB7o
         kc2g==
X-Forwarded-Encrypted: i=1; AKwUvBynEdfLlQxvuesSfAIYPQkwfGwjQFED+ri9NzQuDUcF0tBBrWTlw1R6FVxY5il1brERcignk7OLvZUW/8A=@vger.kernel.org
X-Gm-Message-State: AFuF++m9UlIKAhb6ra++3OWvZkRSr3V3S8PB4JM1rNHXqaL/zwh1Q1a8
	wBlLmOYrP1RKlepW//o4Vg5f5qWSFNMsFYi8VSBsZSsdeufnhRJ/7Ulu
X-Gm-Gg: AYBFou0947LLbeOZJtJbbJB1IY6e1OuQmXeBAoGQd2ncdD+MLvTCmvoQNeStQQWj9S2
	6cMm9yuEvaImLnT5S0qMAK3b8LWucUDcAWES0XCRfofNk7E96rpYz59OCnflPxLAQSUbnp7n8yS
	euhBiJJsBeBVXeMwWTdECIHQb0npz0LzV99JEMuGo6CsxNViwPDK3l0kBz1sWrHNqfSejwj04z2
	59yDIRYJIzerT2yLFs39Z2USGPDOTHjjQjisAZEoMJ9MnD9FvimrIIHidik3S2j/tQ8PiwtbN0n
	IlJUGeh3kVXku2Ttk8suLIYOXJJpzt1ypIAcOdRSohpo9v+hJ1ef4r7lfi6PV3spjl6adQoHH+x
	5sgKpFAPG+VtFNuNKzhVjB0EFtXu6jm+Av5e/9kqs28kKwCgYm6vMAOnX55kVPcjc6hErVXyS2S
	EKAMvuCOzJPB+b5O0NMhtaV6FsObUq4Ih1auBgqPbJ8nLaStMbqYt/6NVYbdsb36enitupNGKWG
	/zwxj1aLtzr1sr0hKCUuPUS2A==
X-Received: by 2002:a05:600c:1c2a:b0:49e:7cc6:ec88 with SMTP id 5b1f17b1804b1-49fedddbad9mr107313315e9.1.1790407911686;
        Sat, 26 Sep 2026 00:31:51 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm18198789f8f.8.2026.09.26.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 00:31:51 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: sshegde@linux.ibm.com
Cc: arighi@nvidia.com,
	chleroy@kernel.org,
	christian.loehle@arm.com,
	corbet@lwn.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gregkh@linuxfoundation.org,
	hdanton@sina.com,
	huschle@linux.ibm.com,
	iii@linux.ibm.com,
	jgross@suse.com,
	juri.lelli@redhat.com,
	kernellwp@gmail.com,
	kprateek.nayak@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	maz@kernel.org,
	meted@linux.ibm.com,
	mingo@kernel.org,
	pauld@redhat.com,
	pbonzini@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	seanjc@google.com,
	srikar@linux.ibm.com,
	sunlightlinux@gmail.com,
	tglx@kernel.org,
	tj@kernel.org,
	tommaso.cucinotta@gmail.com,
	vincent.guittot@linaro.org,
	vineeth@bitbyteword.org,
	virtualization@lists.linux.dev,
	vschneid@redhat.com,
	ynorov@nvidia.com,
	yury.norov@gmail.com
Subject: Re: [PATCH v13 01/13] sched/cputime: Add kcpustat_field_total helper
Date: Sat, 26 Sep 2026 10:31:46 +0300
Message-ID: <20260926073147.140907-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909135617.871006-2-sshegde@linux.ibm.com>
References: <20260909135617.871006-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Weekends...

> Provide a new helper function which sums up a given type of cpustat
> over a specified cpumask.

> This allows the caller's code to be simpler and avoids duplication.
> For example, subsequent patch in the steal governor use this exact
> same pattern when calculating steal time.

> @@ -207,16 +207,12 @@ static unsigned long hd_calculate_steal_percentage(void)
>  {
>  	unsigned long time_delta, steal_delta, steal, percentage;
>  	static ktime_t prev;
> -	int cpus, cpu;
> +	int cpus;
>  	ktime_t now;
>  
> -	cpus = 0;
> -	steal = 0;
>  	percentage = 0;
> -	for_each_cpu(cpu, &hd_vmvl_cpumask) {
> -		steal += kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
> -		cpus++;
> -	}
> +	steal = kcpustat_field_total(CPUTIME_STEAL, &hd_vmvl_cpumask);
> +	cpus = cpumask_weight(&hd_vmvl_cpumask);

nit. The cpumask_weight() change is not mentioned in the commit message.

Thanks,
Kayra :>
