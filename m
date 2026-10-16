Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5360F382F35
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163916; cv=none; b=pPABmU8ZMew12z3hG47rI1JopAAucqynqwVPs3wzuDpMljD9GwOO3sjrS+xeC6eBmtfjDEKAwQlN4xMALzwbWLduxVH/gFfRvCCkAaxtC2UpsTrnvO9ls66ic/M7q+cP+imUvALgPsSyn3aJpwLtP1m0TCF7KhiSD6UByszfTXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163916; c=relaxed/simple;
	bh=O2RzggFs1bjfXctsFTnmjze2UQnPIPO+HIGT6FFRaHE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=IE0+eB7g4GRPBaLyqZn8475TWGdsD83oF4pCvhw5CCTI5FWTPoShGnq5OiH2EealXEyR6AKSA6K9yQun9Jji0c99mmuDl7qVmIggopsiCTTMoQXrchQqGxV0wvN5yPczYxZFYI7iXxoqDR3AsIBt01YJb01GOXuBc/WCZLaYzlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUs9YMzp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUs9YMzp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so105817a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163915; x=1792768715; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2RzggFs1bjfXctsFTnmjze2UQnPIPO+HIGT6FFRaHE=;
        b=UUs9YMzpTMxJGRaAfWa3CFRnVugUED4ewzMEYAs+15Pf7d71gdu9iah62xjNMquUKn
         Jva0nXHGi2nIfX9DG6u7hNZePma7dJc1emBTS9apc6vNpApbi90hEyrIlNn3MiYxo9Fc
         pEZdHxZtXaMXl/O+/EP9fjMQpcpe8jaDWpP7/mXAyVdvqNef/cVNHTtaQ5XMFuHcwzED
         dUneqJtM4MYFrDqMlPuOoDYo3h66T+pR+f52Gy21IoWyfJgnl99672s2GJNn5Q6CAl2l
         Q6nserenSMSc+UEpCP3n4JBlVwLVsRdfsW0H3W197X1C+kHO8I5k2PCaT5g0VnJxzxbO
         DBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163915; x=1792768715;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2RzggFs1bjfXctsFTnmjze2UQnPIPO+HIGT6FFRaHE=;
        b=NZfVOXhlBQR3mawcHHTf9g/UX7HzFo4ABxNI7YwKHpzQ1XuxE11vzA6KXBl0zWA187
         xfud6lviV+YEfig1Y6W+aHpCarIK9DwNVPjUzS3yPkg/M7ueqtenMZeDLdHAKlzFiJEK
         n2PVUmeGu4N9Bft+qkqMDGuiKYk3Wth3byXhBcnLFGXqASv/Mcyyhj0XqxMvmUo+QFxw
         /VOPorYbmpcwabKX+tz6nVAD3cGMvgHgZdLF8Hy8jHCFPa5Sgx4hSQ4zrz7J5ZO1ZJ70
         m8Bz1xtcuTGEPdehpVdjng797IryLwPwqUytD5g/zKX7hSqrQtaQxSfDW3OwKcGiNaCJ
         v5AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYnr4xzAFPFKe3UQ4W37Xw8JPv5b5CgxPhAJFkbXrNsEX1swpetNtImmqqyoCA200YcZMFXxUJjHFc08c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXW4C1BLcu/toxwEaLmQIbE2ONq6s+elHUgN8uDiO8IcVMuVjd
	M06uT7gI+IjPKjqlCygBet7zABE4OGtvdsAglPyTacBzDWWtgCfiVbNDWRXNgA==
X-Gm-Gg: AYBFou38D3Qu8/ZGaOe0Mr0VYWBxrRM2X+qh9/6z8nAzJ5NcrQxxU01fQFJTBmXvV3V
	VVUOsV3A1zmgd9ZV5+HVLYeQ2BG+QM4mJIJKdKm3Z8wfDB7T4iVWPOucCgl97mFEaXXpsXYp3Rq
	yXUUgEGLndoz6AaRPoWji+Bn+6b0vQKk8nwgmwLPPeQi11udFup/S3tT0dQtoeAzxjhkedRvrMN
	27ND4wCWqLxY1IrmPkpUh27BS3Smg7EXXhiLhHdTbJcQ846ZPaiSZY3ZUgEphix3q+lRyOFPEKL
	/ChgIvnolDH7TVA5mhl4Un2kAS5XHZhCDdGVpivDa4IsKs3TUIlXsEVe//ujFCQN5btn4XtSTHY
	IA+S4boqNzeai3KkT6Hc7JIQWDHs7f1I8Hc4MCC/lqNi40jpyvHOupKEKsgg4jQGoqU1r+4mW7M
	XQrcecylUiehV+rprEg3u+0pQv/MsrTVh2hHhyGry/25ziC/0vl1U/CySxbllgScMTtq4VIR4e8
	amZONt6K1nBB2KmkjfUcuF55ASDdLKiUzYS+g+afZC46FjfdSBXDw+J/J01vgo2RjqW+fBpjSKl
	two=
X-Received: by 2002:a17:90b:3889:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3acef1545d3mr137430a91.44.1792163914509;
        Fri, 16 Oct 2026 08:18:34 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm1472146a91.4.2026.10.16.08.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:18:33 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 15:18:33 +0000
Message-Id: <DM6D33SL63BR.HOFSY6JUHO44@gmail.com>
Subject: Re: [PATCH v3 3/3] LoongArch: BPF: Optimize 32-bit operations using
 native instructions
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Huacai Chen"
 <chenhuacai@kernel.org>, "Hengqi Chen" <hengqi.chen@gmail.com>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20261016081006.26069-4-yangtiezhu@loongson.cn>
References: <20261016081006.26069-1-yangtiezhu@loongson.cn> <20261016081006.26069-4-yangtiezhu@loongson.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 04:10 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> All of the testcases of test_bpf passed on Loongson-3A6000 (with DIV32)
> and Loongson-3A5000 (without DIV32), here are the test results:

fyi test_bpf is gone. See
commit 4532e525b286 ("selftests/bpf: Remove the old test_bpf module").
Pls run test_progs
