Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068958;
	b=UppT0vDTgn5ad+kN7Y8EdGEsOYX76jWgp/ngzu60Lnx6gtB+9bslGF/uC8okCVFctzHf
	 DLZnBbYCpRjg8OadlX+yA24zSh3YDS6uGCekAFFZjgH0yKsc8GfWF+B6VCPkQgA1CASJ6
	 KOq6NMFLD583g+cHS/ECywSzSDeB9MpM/4zLRroOrRG+Hd1RGfCqKMT72G/x5VMvNjSGO
	 7dENh7Pben7BjP9XGrmXY/KH1HOraXFYpYrSYCFAx0jyaFOm0iBHumMu+8relNMNuG6gm
	 GDKqTkdoovNNEQFVWhxJ9FUCL4bpYyvklou8j8KEjAZ0Q8xzzejoT0PgLSs1X8R+4LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
	b=Yws53hjYxT2nLFohzLn7Jy+0aTAXF66hNkTwzkMkcCJanWUs3pgycvCG0ibLOs0tb2lG
	 38tmadLd1FdLecTMkMMnN6rhyHPweRa0Grc/eUnf4aS2J2v/bTa2ZhnS7+3Kmf75J3kaA
	 9VVvdwGmFaPI4VocSXuULefFbc4hyyzLDGxEsMA9wGk39TB5mkUJg2JoZrsFuRYm1lF2h
	 dXTuB2czcJJOc2L7pAK9WwAEjNLd9ED/dufBKBEffZpGIYlyg6tT2etkIn+x6qBs1Maqb
	 xtY4298mQkmTSL4/4oYQTOzFQ4LvJ+JWWsPv24qpM70HJTLZ2Hl4EWS6wA3scy/p/Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=nAMLJ4po;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DF606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621DF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=nAMLJ4po
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1846bc43c28so4071766c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793068957; x=1793673757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=nAMLJ4pov/UKnTCLgH305UyFiee1Kbb1n3tCzOl712VaepOkFQaBHOfe8TqG3p1lZU
         FcmqVqrrqUreTloBdzXh9C3S8RzvKdqK0Wdm3ymTtA2e7F8hg+g3tAXi0qMz5tjjKhfg
         XZsmI+gaR0xwl7nmIQiVOSWVXQuFdQ0nDSV/JTrdP8vh+zCmGEp4ByKhGzO7Q9EFAqG7
         Z9UxSRbzl1SyjYddPBfqeotnjUxiWUf5QMQHMI+2cHXwFS8e7Vcd6faApvoLAEI8hyVq
         H9p+0vB8HKXlTDO8gBcIdyEeUOqojMCpKudjjewsxrlbiMp0bSMq+X14CJGfZa/XuOHM
         djkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068957; x=1793673757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=cLaie7dpZCPdRoUThOqVCv4/Y0fVE2nt3hoqZUW1trncRDsStgUd51YabNo5n3bZaM
         ZfRXzFNoeNFnEcVGLfD9kMBQq1dSx2dHUjKphnWba020SCks5fUSN2F8KuiU3HjvcSrd
         yPhl+fieMgIWdwuxH65WBo08spjHILPSR3xLY2I+I+QqOhxQhwJf0/6d0MNTQO5pdCFh
         WiD2ckDEB+9jZEjQ1Mcx1jmGZ8dHOO3uJjzljWbOXp60w8BBOsEEn1J0stlUXLm22yIN
         vTThxf+uqOqYOJN/0YpWY7nazj8epFuIcnNpOr6ZbG2dp6weCnQEESHN86aTH7SrWITp
         XXYw==
X-Forwarded-Encrypted: i=1; AKwUvBx7FihJGSjmUFkziJyP1BwlnNYmrtienMeWNcrGQO+8GP+nG8yO2Ot82nRoo3j3Z8tkde4ABKrVYXQPPrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPZwFglOfZyt3D21VAbI17q61pt2akL/DvQZbLB3VUZze9h5RM
	3NFBHposazBlzUUrCw1Pgy4njhETSmMJbMYssJDgfp+V+8DJxHPmWaRoSrvof3pvY30=
X-Gm-Gg: AYBFou0ve7qTXyzQZGFwmWaQDufUMOchgyeKRdsckksmYjXJyzc8h/c+JYQ6AR/gYpo
	bgX53gMKyz8cfgi5lfNePQWdp15hUDVuIOn7ydXk1CGrWCAw4udUoTotcJgZpvEd86O3SnkvoJg
	PO/BF242mkTNfcKVKzieTFAolT53H5EPVFjBH7ssJoCI0fwjM0xRdkm/S7mHEkfPc6KAdYefdVQ
	oEz0HEkiY0PI44vfWtUOkpBz5aXeMKbgP1JxJDjPYL7KFJ7FsJOj/tnKqvif2ob669c/tQUybhh
	JSz0NSIi0ameEvwZsENjEh5mnW1tGI9qu8hVaVxTlhRRaaZfSi8YIg4dptMDq7Z1RiqpF86M+CB
	iapT0op3FTCn0kmMEa2B9XRnkk2aC2PMpT3EHCqxjTE2+RyQ9sM9S6d93O3V+B/9PuKgqCq14Pf
	EAi5h7LvI/sR6aNd3eM9f/4zVXM0egUEwakHIeOx1BOeCIExdHZpdG5rRqfGLG2HsqWdcISjKvx
	Nb2sTjAkGB7V9vuxQwb/AFHYtg8g4H5beYGfZnCzNpLYrf+ghRJ4f9Xj+9pibwVi6hRzC6zp/QB
	9tnjiVeJoxt12X3UxiFBSGdCmvpTT/rkCLkqZS8=
X-Received: by 2002:a05:701a:ca07:b0:144:fd7c:84fe with SMTP id a92af1059eb24-19937307669mr13761314c88.35.1793068957501;
        Mon, 26 Oct 2026 19:42:37 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm59514670c88.17.2026.10.26.19.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 19:42:36 -0700 (PDT)
Message-ID: <30b1cf28-61e6-4f28-8e28-79815bd87617@kernel.dk>
Date: Mon, 26 Oct 2026 20:42:35 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/10] btrfs: Don't copy encoded read data to user
 memory when canceled
To: James Houghton <jthoughton@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
 io-uring@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-btrfs@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026215226.3713941-1-jthoughton@google.com>
 <20261026215226.3713941-3-jthoughton@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261026215226.3713941-3-jthoughton@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

