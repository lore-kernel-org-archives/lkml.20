Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289591C695
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009487; cv=none; b=Ej7V2U5IxWk8V05Vr4ZhSrFy+u2I4/y88YkHWtpziBUIia7Fa4hPCGXoJvsf9QTdC7nXYXNj6y2bQE4uBD6V/yAKAkCeOVp/j+QKG5IKMbbOFHyR9wEzlCGy9Bz3Fr76tY3Q9wLyhq5/QW6FiaVfAey3xmraqYwjrWr7Q1LuvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009487; c=relaxed/simple;
	bh=w2CHf/Ruyl0ieMWiVy7QleNiafjxfD+l+EFZ1XXXNB8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=RTBVv+RrZEcVhXjDctZgewopeJLXj5kWV5rP2HNyrpNB97xNshmtgJSt5pDM4SS/Vch1MGkCneu/TA2uRpMoRW4fqDzgBtHBUukSytfWvIYLA6zXXESPY/wo1zBpzzfkQv8enXlmGZojdgvdhrO7lhkiz1HylcAjwoOjmOywEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir4gbnxE; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir4gbnxE"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c3304784so48116a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 23:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791009484; x=1791614284; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rn5qy1uct3HxkhX0TLP/tcAeQOQET/L/4W2RbNiSgQ4=;
        b=ir4gbnxEYnj8MisDdoh2wYz7JDHlJTCmhf8medao28SMIzq4NAWkf0ReXrErcyRePu
         KYL62hbQCDuBRabP53yqOzo21q9Z1Qu3JS02vsmrsF8lbmufMc4VpPVBKi79MTCXIo33
         8wUcc7BS5tppb1lzOCyUW7Pbd4tZpmLBF0s9MhdUEdgZxxOIoFlh8nRqh77cIJ+d1Kom
         XVc+9Py5vO/ZY7NNBhTjHYlKbzBd2zgUgxGmrTTjIPGnpaerNNgFmzGLOupGDtJvz9op
         e7c8gqGeTkF4yGlIJr6T4txba4hezFKH+14YeDOtMxg+o3hzr8eeMmp1c+W9zjWzOzVO
         MJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791009484; x=1791614284;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn5qy1uct3HxkhX0TLP/tcAeQOQET/L/4W2RbNiSgQ4=;
        b=zU/t6a6dWLEuOJcrMgz/74E2UmFYUpHhbvD1hcw+FlITF7Uu++/qSnyYxEqz0RxYki
         rG6zuqfqXdeL6q6AZlZGTIBKAtaqQ30EJWaMSo9jrKFpJZZl8oyRKRdCOANw3ViwzdrM
         6oJeyE7prfDPfAViYiKTuNV1tNx/SmDNJ0Y1wU4hAnpoMFgWa66U/M7fomY143koEuaA
         NNyJRJMVkRjXXNmoZaVYwWaWwRskPOo1uvMcdNpN9wcJOWeC7Vcp/ljvU6Kp4QnlR6fk
         aj1gtPfQ5Gw2ccSUTPdkNKni/nitJvMw2H/UH2LMNZzc6T+XKMje9aO/es4UvJxhEI1F
         BO3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwY9lMvhmmrnndh1fT7HkKGabUGYvQKlLSZNc7w3jDysjPGGnYkZiiyDYswfDP08oU5ZRogN71mFse/efo=@vger.kernel.org
X-Gm-Message-State: AFuF++kOn7jRJDlfKB8Gr+xSeOCPNu3PYMfBjKpvVl8Dt65RDP/NiFtu
	QthGK+8bLTQHjgpizGRtHsSeuNhogifp9yv/wGk23ZplNOej4Ebf4R5K
X-Gm-Gg: AYBFou1Nnn4cJ3O9uBXNOSRwm/ahJqv+B8J+8jSycJLq7JTSMAInYzEePquzLDVU86j
	zjjgS5isbXzMDdJLNMLp10gBBvtoNO2oaftYEVEHHhf92+OQBN3fahWDKjef/tzaogf7Blo0fZG
	EzAP7YInu3sesXcPNMCF9nWYnUjexZwuwxDrAEp/QsuPuGjlHZCn8dxdav9gNmJPHeRTB1j3/QH
	EO9ncj7dK9HLjrvKh3za3hDOz8nSg+TTDy4Obmh36i9qEjYSnLu1cP/Ds3e+xcQXQmE0RCwStBw
	COUqhniP4AferHXJuiowLjf+OcfV7U+w/f8htd+HhbZBLe7d9lepelCYQPw8KMQsFGbc40rLcEt
	UiPMr1Q1URbrFfTcYRDqpR0TwV1WVyCC5Au/CndtoNHsQRGdHMsqfXyQOYC1C/2+I4NyYHgrhS8
	k9as/1O2TPX+vo3gvyiPrzgCYwRRljAgvbvaooE8CotnIp557Lag/WOKy5qXe7TrdIoY7e/mR7A
	nJfegjztjgFxKbpd8shdBF8P+L8/5IkK+owhv42Ne5oHDBiZ9jm2Xzyd5quJiEvu6D+VbWpqkoA
	Ico=
X-Received: by 2002:a05:6a20:7495:b0:3e0:b778:d988 with SMTP id adf61e73a8af0-3e0bd4bff2bmr4998287637.83.1791009484332;
        Fri, 02 Oct 2026 23:38:04 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm1809155a12.17.2026.10.02.23.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 23:38:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 06:38:02 +0000
Message-Id: <DLUZVHOLSN1B.115EUX4KJBEA3@gmail.com>
Cc: <alan.maguire@oracle.com>, <martin.lau@linux.dev>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <qmo@kernel.org>,
 <nathan@kernel.org>, <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>,
 <linux@weissschuh.net>, <christian@heusel.eu>, <mcgrof@kernel.org>,
 <petr.pavlu@suse.com>, <samitolvanen@google.com>,
 <linux-modules@vger.kernel.org>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, <acme@kernel.org>,
 <namhyung@kernel.org>, <irogers@google.com>,
 <linux-perf-users@vger.kernel.org>, <jikos@kernel.org>,
 <bentiss@kernel.org>, <linux-input@vger.kernel.org>, <tj@kernel.org>,
 <void@manifault.com>, <arighi@nvidia.com>, <changwoo@igalia.com>,
 <sched-ext@lists.linux.dev>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <arnd@arndb.de>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <abuehaze@amazon.com>, <doebel@amazon.de>, <mpohlack@amazon.de>,
 <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next v4 00/12] bpf: make the vmlinux BTF an
 on-demand loadable module (CONFIG_DEBUG_INFO_BTF=m) to save ~5.4 MB memory
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Jay Wang"
 <wanjay@amazon.com>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>
In-Reply-To: <44315425-c505-46fe-8379-f19d78ff3abb@linux.dev>
References: <596bfb65-db2d-413b-8039-c921031b50fd@linux.dev> <20261002073422.14253-1-wanjay@amazon.com> <44315425-c505-46fe-8379-f19d78ff3abb@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 02, 2026 at 01:58 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>      Keep zstd-compressed blob in the kernel image and decompress and
>      parse it synchronously on first use.

imo this is the only one of the three worth considering.
