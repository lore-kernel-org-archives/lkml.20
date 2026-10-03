Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EB841F344
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029954; cv=none; b=nYTNOeUII9smgYSyAh+amNYZRKvgrKrf7gHq0w3Y+2mYEqApvtsCAiL7FYwHJqQy+c1NcbtFPqJO1UInDZTLHW0ILbgErh0alPyKHv/vbElxIM9C7I9RqE67t83/CRdLLt/SzL+/AhXWd/oYDGqj5Bubx5sdVdJKORF6gXxl+R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029954; c=relaxed/simple;
	bh=V0/7vUbzZ2WS3ekKYc+/9kx/XXTqOYvzaiHvHZHSBnk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=iHNueW8/LhZQFhtwki4pGYAT9SW45rsBZ+Ka9CxqFUnEEumc7Qd9cfer+SVJwc5jBdXFmXlJHwdgtWMEoi3MZWRv7cQ1vQrp42TN/RVSdSbgmDjKMtdOhHDndYjAPRV7SHuSWmbheC1VxviX8dQTMnksKs5N3IHL/uHMJpKtirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ya1uPvVe; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ya1uPvVe"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so166851a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791029944; x=1791634744; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0/7vUbzZ2WS3ekKYc+/9kx/XXTqOYvzaiHvHZHSBnk=;
        b=Ya1uPvVeeM6n17IR0e8tR+Fjn4A7Tt8xHAj2K4RCLwhM/hfRH2CLdq5KVXsqQ+7+x3
         Bjh71FLm+eHABWYeuAqtB8u41rC6u3Gv0BBngTOtNGGVVoYenWZdoIx3EaA3DW/NqxEm
         r1BZUyVLORTMFFEYNnrQzZPkAX5SzAzBvz9lKEZ3dm47fm7OGnnuU6Pf8eBH/fTDejMv
         npC3Z2mnofQdhE53ZvxxScLXy/4abR1ig/Pap4sIskWXMbYdPYLxYYrtmb8UwcnIJNTw
         789AGnYTn0CFfvhsFtKtHWJVNh1VUA9JUAmfn7mEfHa9u0CqKMUz5YKq5/iDP7QXZpvj
         C1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791029944; x=1791634744;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0/7vUbzZ2WS3ekKYc+/9kx/XXTqOYvzaiHvHZHSBnk=;
        b=nMYa7UC6/MLMez0BNcM0wRZK9QBLIk1IjfBOH7NUREoaxx11BqoprnR6AkefAaDbkL
         g3sf2yH2eyxpFxqNpcp0mJ36ikheOsBgnAXkO5ule+2gRwBSVe0/5ZWFXL3vpObma3ME
         a1tDnwyJ6ypkio3/UCoaoQ/U+9xwncl75AQ+4xn5fDbwC0EXr4MR7a7qPITbXaAwo8BG
         oYw/0ezSAX/QtyfKqhd4v6MNTrVSUq04oquIt6PfUFZZdsEIVlJGUpW0M0ZHYWxkFZfN
         gHzfO2KvKi8QDrU2gNPu3putBiV8ThU/G778efGwZN9xCJTVJE7X8jBX3/A9IEQ8ePZS
         iumQ==
X-Forwarded-Encrypted: i=1; AKwUvByXKLG7/tC4LuOPR8kUFT+XtuNBQfGf5ANUWEtozgb3sVtQTTejSD2J6baZuqds3URK7Hbhzut+hyz5xjk=@vger.kernel.org
X-Gm-Message-State: AFuF++kH5TwaorEcIwBQKK6Q5Ahc/JKIZdhfR4fvS18Do9qNUcCIfHxC
	E22YygZaZnKTEJxCeR5bPv3H2q605L1fANDCRTXAjXashjoqKpYYhu95
X-Gm-Gg: AYBFou0mZbR9JWlOXPn42KETqootLVhdGyvMZKXk+farWWgyV2sv+PaFPzXGBROlUC8
	x5lOy4HCki/Y+IAf6eg0jlXxUxazl8tX3UuJRNcylP9EExzU0qB72Y11gKIbZ7rPJtfPLRbxDzT
	2L5Om/Y5WXD0VkYxb+6+weCA+hT7DTRXvpCt7ZGGYWbJCIxXrJiNDj1c9ehcD2ky9RcacV5NABL
	rdY0W+ilcfQQF2lw3fC1ksLw1luAx/6rdX1m86Ei0/RoQJ6qADmsV5SIBw3HAeprRO2lUqGG1Lp
	EvgklMad8BX67Lnger4w/LweG90sKHk2ezUD6yMFKErstWVKWsUGpFd/h8kJle6rlCWkKEpNt+I
	i7ttI+Q9n5AlGyDWz9+hWijvXqmbWkdy+qE0JWsrI6MOEedHK5zoSgfYWgPB0V7fCmysN15Jm+y
	WfEz0XhIjUqsRzolD7Hg2mmiGLtgUEfQvbbLxBM6APGLrG9QoCW7YvMkXPm15B36bA8YFB8qkAl
	ZsHQoZRqA15zbNARCGLetUwqNZKybAItBfaJ65a0GkUOQaP5NcieLkmy2n2ovwV5a99CXvjNzqk
	58o=
X-Received: by 2002:a05:6a21:d89:b0:3dd:a197:7360 with SMTP id adf61e73a8af0-3e0d6d8ff80mr2052536637.57.1791029943830;
        Sat, 03 Oct 2026 05:19:03 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cca561e9d1dsm1740373a12.6.2026.10.03.05.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 05:19:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 12:19:02 +0000
Message-Id: <DLV74KRI1SBL.MYZVQAB3N6QG@gmail.com>
Cc: <abuehaze@amazon.com>, <acme@kernel.org>, <andrii@kernel.org>,
 <arighi@nvidia.com>, <arnd@arndb.de>, <bentiss@kernel.org>,
 <bpf@vger.kernel.org>, <changwoo@igalia.com>, <christian@heusel.eu>,
 <daniel@iogearbox.net>, <doebel@amazon.de>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <irogers@google.com>,
 <jay.wang.upstream@gmail.com>, <jikos@kernel.org>, <jolsa@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-modules@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux@weissschuh.net>, <martin.lau@linux.dev>,
 <mathieu.desnoyers@efficios.com>, <mcgrof@kernel.org>, <memxor@gmail.com>,
 <mhiramat@kernel.org>, <mpohlack@amazon.de>, <namhyung@kernel.org>,
 <nathan@kernel.org>, <nsc@kernel.org>, <ojeda@kernel.org>,
 <petr.pavlu@suse.com>, <qmo@kernel.org>, <rostedt@goodmis.org>,
 <rust-for-linux@vger.kernel.org>, <samitolvanen@google.com>,
 <sched-ext@lists.linux.dev>, <shuah@kernel.org>, <tj@kernel.org>,
 <void@manifault.com>, <wanjay@amazon.com>, <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next v4 00/12] bpf: make the vmlinux BTF an
 on-demand loadable module (CONFIG_DEBUG_INFO_BTF=m) to save ~5.4 MB memory
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Alan Maguire" <alan.maguire@oracle.com>
In-Reply-To: <7fe71959-1c58-4b6f-9019-6f886683530e@oracle.com>
References: <DLUZVHOLSN1B.115EUX4KJBEA3@gmail.com> <7fe71959-1c58-4b6f-9019-6f886683530e@oracle.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Oct 03, 2026 at 12:45 PM Alan Maguire <alan.maguire@oracle.com> wrote:
> The only overall cost is if when we wind up using vmlinux BTF with the compressed
> .BTF section, since we have to do a full vmlinux BTF allocation (on top of the
> spac taken up by the compressed .BTF section) right? So slight penalty if vmlinux
> is used, but big gain if not.

I think it can be copied compressed into vmalloc area and
freed after decompress, so memory usage should be exactly the same.
