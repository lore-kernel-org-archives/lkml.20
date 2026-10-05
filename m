Received: from mta0.migadu.com (out-15.mta0.migadu.com [91.218.175.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E63932C6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791188920; cv=none; b=G7zxqnV3dCkNpSYIRZCxZclinIDcJ3QYbLEefqHlVvbKW7nOYQGd6lLe1eStcQH/Gpj2KjHBAqEWpABVeHW6ILV/7D1WAN7oJH4hTwuqp6l44JNLw0qn+aXIW6eXpCcaoAjoeJCMo+xZPgZBjD+O5JlOjm1zhYnq7AUx3O+1cr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791188920; c=relaxed/simple;
	bh=azL6RWzxNPLFbjqexUqOSuUWiCvD6BgcwHGYwvXeEQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVX5xDw+hZiS0AiXqdVgy6Ss2uiSmQ5a8vMwlxYSu83jmp0s4sKSGMInuPvS/7VxiJE7QH1CfFwEfUbsvapvHvj+e3+Gm9O32pvYS9yvmCo1SZ/zIE+naVebS0mKojFpklUJzQlt52qLi5Pp731R2ocNivh2/31vX3yuhiCxMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u/7csdmW; arc=none smtp.client-ip=91.218.175.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u/7csdmW"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=azL6RWzxNPLFbjqexUqOSuUWiCvD6BgcwHGYwvXeEQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791188910; v=1; x=1791793710;
 b=u/7csdmWPh3JSTQ+jaIARSVNEGv7TPfWZPa0W9J1A6FLBCmkficHrVXNquw+rXTd5tn9HJAg
 fiUu4dpo3PZcH0WSxHCg7skVLMsWvAcefg7ikNnt8uQYp+ZMq2SLfhO0ImsT7J+MtP4TI1Vd8gr
 aSCcb3HP31fapkkjHtpu7GXs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 78509a93645ffa2b;
	Mon, 05 Oct 2026 08:28:30 +0000
X-Mizu-Trace-ID: 78509a93645ffa2b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so3581e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRhB7eNDAvbrGiLtKkqdhA2bCKkjupppfc5rD+oQSytxAnyMBi30tQ3wOBC5dPd5YA7Br/avxyQZSrZyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1B87yD3l4hP8EeMF2xU9cqiRKrF0A+n2mg1sz8pkIGGmtXpLQ
	NFthavYrKchKFS+wMdf86JhFYXoQzdnQeFwomz+3uWLMBwfgIFD1wZcxmgGVnVe8WSZ7blTPbID
	z5/lUgkfh9XUQ7wmfXA9T8C0TIQTV18C5tF4eFo2N
X-Received: by 2002:a05:6512:440e:b0:5bc:b531:51ea with SMTP id
 2adb3069b0e04-5bcb62cfb9dmr110049e87.13.1791188905794; Mon, 05 Oct 2026
 01:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005050349.836795-1-fuad.tabba@linux.dev> <asNdAXGkxagm88Su@kernel.org>
In-Reply-To: <asNdAXGkxagm88Su@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 5 Oct 2026 10:27:49 +0200
X-Gmail-Original-Message-ID: <CA+EHjTxG=JUc7qERzdkOE4hEMUVSWK2AUtcR1JJ-k6S0m_RxqA@mail.gmail.com>
X-Gm-Features: AclHuK_skcmiWKYt-g9sV07lqcK6sGjUvRohlQWsrIQerdG0YwJX1vJl3n2KYq4
Message-ID: <CA+EHjTxG=JUc7qERzdkOE4hEMUVSWK2AUtcR1JJ-k6S0m_RxqA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: selftests: Check SError is not pending
 after delivery
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Mon, 5 Oct 2026 at 10:17, Oliver Upton <oupton@kernel.org> wrote:
>
> Hi Fuad,
[...]
>
> Can you add coverage for the vCPU events state to all the test cases? In
> addition to the case where the SError is taken, it'd be good to assert
> that the SError remains pending if the guest masked it.

Will do,
/fuad

> Thanks,
> Oliver
