Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B963ABD80
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426538; cv=none; b=lZvrjiSrmFdR36XTqHSsMp9zFeR0kmF1+KY26Do4giQWpr0kEZ7zdzC/mKjWUcRn72eE2qe5lyEv0fotUyBVTYHw2zRmJQUWI0kZsDOImrEnjTKlBToNxX8GjOEBP4qsuP4oTHnr3UaRzJNlVFuNvK4XP62XnlooreWO37Xjbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426538; c=relaxed/simple;
	bh=sKSpzcAytLHXA4fudNRbsNoo9eCHbGh/g0Cikzg2xko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arljSeUKqAdcSqOoFKnIpLyCkFUS2rQdM/0/WaJsJnbZ7BPfRrgsQuSKJmqFn+2JmP/+EXme2q5i8YjL5io9IiewaC7+Ejz9msAgi9X/lWOBP1VSY7DvjD1jav/n4bJCfX2oRLxSPZryKQpxHVLFsFiRFTYcFHlzDwFvuKpyLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd8J9sg+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd8J9sg+"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so901397a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790426537; x=1791031337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3nGMV9CTrwS9xcsel/dvLA5UKRn0rUB5yA3qbzghtk=;
        b=kd8J9sg+hluqCmn30umpq2e80BaHGjSnXl4nd6kPa8CUqaMtGZpm5TbdsIoaKJQfUp
         KxpLJnt/vYzskNQPy8Y5sJDxXfEUv15r2YcTPZlLJbMyYe6tyikGamGrXgQyV25Yd2O2
         OGMlEhqoee+tSTTet/uNWE5iTXVnAeNmf+dtSk/AlwMBzPYlvR7R5WXqpIrjMP34YilW
         mp4+llubzXqs51opDDTt4aFH3g54cl3MgrJXCGMNAj9HSRVJP6NM0tVPq5MqCkEJbnzO
         wirSDO/TPyMuSF8PyD2gWjFJsXkmzzUGDFshRAigdufcb4MCEy5spZpMSlBWyoJWSmQM
         iagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426537; x=1791031337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3nGMV9CTrwS9xcsel/dvLA5UKRn0rUB5yA3qbzghtk=;
        b=puTfDsShks96/u6cwRmtQfyKSV1Uzpde9gUiDodoUQBIVWulSsU+uo5krNKDC12K32
         3wkl6lWYEx5Gi5lw+eyKTQHvIxwjItohdrzlK4dvBcMYea+bY1SBp7eVH2nnMlrqmE9K
         MkMwCziK/uhn/i/mFYWQsKTS9Rtyl5iW7s+Z8qr6/QVZlnwbOdcUw+yIY8ZBbawsTiSI
         YWqQFUO7jy7wEsIErbAXQm+/fvxox4P7jrN3f8xW4NAmCQ4GUMR1QUfrbHyLgFzXW5ec
         OufPV0PO42hZN19YtHzXbdLSO0er2s261q34W2n5B9N/FIvVJnf3s6UNIIn1tV5Gyh5S
         obgg==
X-Forwarded-Encrypted: i=1; AKwUvByEg9nKhQWyD+L1ItiQKsaZ9S/uLBvJmag2+RpztmLvcP1wdNLvmba82V0o4mRkysqgJCaX+mJSa+HUY5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTu88vcOXKFfMEAyz0fdtwQGtJJ/hkMTFtueCu7CJBMQORXTnp
	IDYaBjTbOal0jaXrD10LM4gDCI6YNp/8JqjaEZvUBINsD4MGSr05s3Y=
X-Gm-Gg: AYBFou0LQnmcKW/3vHohDCc6UzlAQhX3DokcKL7T2DfNKrGbBMmlUSDeKPO1lHXUa8k
	AWdImqAgDHjkfz0rzEUQGs/k1y74+AA4Xlw3M9GsDgzpXT7Bt79c/St4osK9F4My30GvPvmdYMa
	pxy/nYS+craKPIRRG+E1PNeU6Vw+XTVZD5qTSTBKluOlgl/OwClqfifP/v562Lj/x7owtcvAmXA
	Hv7H+7Vu3mA9uDsBtGmKhX3CCdDHTkacLwlWXfuIRjJyd0OKvV0yE4hu9popG5YvjycEX/BNkhE
	7RyW7lJfriI45AfeBqBcKQ77lsXZCoGIQDFMtkiUqhzSf677D/yIekhdbb7bRYVGqKPCWLQeqK8
	BUZiJmiIz5pgz5ksVz5kCo789c05XcDRpzsFVrEEIjvWu6vqctkJh1jcQxE+20JQCEcNqA8fpDB
	Zk52rtH52psn0gtdvH2Mi6t+vqgqyC9mVCjzxHyf8H86f+3adRF0REeimOR7ncCyFJKFjK+l/Oi
	Fh7Loqa4/CLpkxLHp01e4qm
X-Received: by 2002:a17:90b:254e:b0:39e:6a81:f351 with SMTP id 98e67ed59e1d1-3a098bb66b0mr6996915a91.43.1790426536797;
        Sat, 26 Sep 2026 05:42:16 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm16337350a91.12.2026.09.26.05.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:42:16 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 26 Sep 2026 21:42:10 +0900
Message-ID: <20260926124210.2878601-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924214811.19ef8af417d37071ed8338c4@linux-foundation.org>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com> <20260925042907.2330519-2-donggeunyoo.kernel@gmail.com> <20260924214811.19ef8af417d37071ed8338c4@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 24 Sep 2026 21:48:11 -0700, Andrew Morton wrote:
> When fixing a bug, please always fully describe the userspace-visible
> effects of that bug.

Done in v3:
https://lore.kernel.org/all/20260926124145.2878520-1-donggeunyoo.kernel@gmail.com/

> Great!  Please add a prompt to LLM's .md ensuring that future
> changelogs always provide this information.

Added.

Thanks,
Donggeun
