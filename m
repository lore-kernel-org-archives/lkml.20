Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794267086;
	b=OOpHwC++NdCF3CFT91ltykl33o889U0YY7xb/wONM56cwhQLTAgsrLOiito6jk5rbkLB
	 TRjtUDn2AIDor7G7GY3abWGYHD6F3bkduxU6Cx710DcmY1RhVnj51EiyAAiPKZNRUQk+/
	 BtvdFM0rLXlue8b8L28V+sTWypoOq02GdH8+LBEPe5btns2rI4fnEjhWcKNTlgqaoSoNK
	 s0H9hHXIif6ctefcydwylrnY2esyrcG5CjF3et+0T61ksQXYe+0N9sWfLElD09sKRoqAA
	 nHbtBdG98pSO6+0flWTuyuUrxfSb0ZddPe2S4P6WPkDvC+qKyV/SEDdVIJkO1FNZU5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HT8waMJ0wlqU21uDHOBtPqMcLR26JjkfXc4rxkOhZK8=;
	b=t0xX7mEn3s8Jqv39r4kydxftdU3c2UsSEjdJquns6k4BRlSwKm1d12HARaZ+EIXKLpVL
	 9R2nudoi4/X8qXCbeEyrXCjf0OqGQfK8A7FM10nPZh2jF+L52VA+HpmLJcUsxJ3z2RU+s
	 IizWh6pNncG91Xb+HConntZ12seqgjRbLFrUC9ljsCQbUW7eT8cd3LLE+lOoF+vd18tbf
	 o9CiZt7mdjvqUTGPLpMnR2G8mDUTj8RZwHU+GQHo9QfzzyL+XEA57aaJlzAfyYywmp14C
	 bGcF+eD7fdNYO/NVEB0qfTnDAgWrVJBwvpDGFGPNo7LQwGMN+GP7lTuWTj3ELfAqIjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="VsaRnHV/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7A560A261C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7A560A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VsaRnHV/
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be58ad9600so1470e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794267084; cv=none;
        d=google.com; s=arc-20260327;
        b=dICWxqCY2gMu5Er5yFhnTS/FDY4hpF40IZjfTB43jlPpHJtgz2JSrjFCZFx/x2/tI0
         zPebLfTqKsmBZatBAIdAC9gljchdwBfqxDApQqexB+zbbhLQozGtPUDLIil3O0xEqO+y
         sBhEN28EuJbSAQRHvKQI7eAs2goYnG2mc0gnotuRjdPS21xrwBLUDJnBRhoaA38Q5eCU
         2ewzq3hfWUX47uB9sjmsdbVKa5H1fJfmNAZAJYBsvqYjgh6xPpjIbbN5f81Oa6Fo+pT9
         eOWCesDd7yl0hKvl5sDJ4yDvNt+drIQNFUKdc0dkucaqFL0mz59vH3nzg+DF0o6lMjUK
         Ei9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HT8waMJ0wlqU21uDHOBtPqMcLR26JjkfXc4rxkOhZK8=;
        fh=hEn7fJE8vEdaQNqCKvGi+67c7wH3+HVq2aG6e7/rlG4=;
        b=GRAKMimg8yGhhJSHMa8VDd8eXOEoKvuU9M1Fy4XwpMpsl/eqTsla48bApYhfeN0kBs
         aGbKpqV4aWSL9t9aQnzE22cnY2Z6+sACDkDdDOLhNtiGMU9FI8nKfxWcPkWZI4Fq+ydD
         JrosGkBc0d4WwNpMhx5wm4/36btr3EXhI++DQCWfQx70sJ4T+8Epv2teBwmaMQUOxSdd
         JHMCeGXq1Vxa1VOE4J8TLu0200xrVdteaql2cpFnr6JfWalHf6urmwXBw/IP8t12ONSP
         IGA5dKLsHBErPOkUeMprtIQk0RhVSZOCj1TmRs/CDQgJgt7OyqDsghpyaHwTGwS/rS0Y
         LQeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794267084; x=1794871884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HT8waMJ0wlqU21uDHOBtPqMcLR26JjkfXc4rxkOhZK8=;
        b=VsaRnHV/tmPIj88IV5UH5O9XloOChnxcIUHd6caHuvvjWl2jaw3iEqBwAjzy32XFGl
         QK8bo6/LHa/jfFduTOQSXVJrV4Pwuj2a+DRz9TFWb8HlDCFe2rjkTTWaNQezBDerjmvY
         peF4d8960JsnkMG4SJwWxURIsyxLxnDYH+0oJ6yXnyAWxsnd/5Oo/lqqWURYalxAHlpQ
         aQLVMJ2LI8ZGKMn67AHTXV27DVfbACwN/rsVUG3BoLM+feu1QngFot9b5fCPFyx8M4Ds
         ZgLWCSfUVCQfU4kIJt3QXdaWWlxT36GUnz21ixZMkARLug/0eMNuIzZJ7Uqrti0prw+U
         pOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267084; x=1794871884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HT8waMJ0wlqU21uDHOBtPqMcLR26JjkfXc4rxkOhZK8=;
        b=Tij1ZXylKD7Uzddg7PF8UlL+sjtMxTrWdYG7uwdyVaNgd/bkHRx9XZ4PXzWhtXe1C+
         0mMe5p8WDHac06/HiZuvAHAaZQDLMzHUueIFExKjOlshIoEXWlRROjZ4Strs1dCtD4UH
         oUJXMBiHoqA/XBXfJtFhK/2OviGqqwK++qI/t4aDkL0Hzh9iaf++P40aVodbvVX6FlPc
         xsfrrXgdBiDpYkrMMygsLAB8G70yaQQRP5wvsG79HL0Tzq2A6U/DpEpn9Q/yMlklqWEQ
         SbTR7en+DNUPD7qJzb4c+lOpF3Kp1BmeiHPQCZ185ZozfI/dXaNYHj2IlU3oHAr94uQE
         sVsA==
X-Forwarded-Encrypted: i=1; AL+hErHM+Lmd27K2fiq3fO13Mz47JKtRqKJVUYSyWKdRpJFg4y2juFZL2pwFgscLG/DQz3vBHe1aPXsMyN0G258=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XJ27T0nTzvfU/qVfZln/SoeDhWT3XwOdrRdYLLDYr7h7E1KUv
	kWIOHc3YM2QylnG+lH6z+U3b26xQNCn+AbA+LgZY1bCMkzwviGVQMlqDq6lRTOdN4MQuS0znbIo
	GRHb7rxRmJLbxWpD6+XndOsEx8orYkzYlI6wSDxge
X-Gm-Gg: AYBFou16eLVoVtKzmXgQexO9QMF7uljTKaLJcPmzlS9f9X45ojoHBs0+dI+UEHHXnS7
	Onnvy3ZGQpvQh34t6LAVryjV/QLex7i944MsU2Bk4pwPbW/1Z/RPtV/V2K18sI4wfsFOxf7R60A
	eYkHhNl+fPVZ4JiqWqFLJ78HxjHx9PWgsqXZLL012nR00LrLgr4iYAOEgKoGQLy8H0TxyU8Xai9
	prQi7SZUn3o8xsZQ3B7abijiwrvVRVNQ6qmrNTahoJoYmbdF5iSAzRWkBv+mt7yu/Rz1E6lFvA3
	N+RZW5NlJcXC/YwNS7oZ9CF7mK30QxiVoJx4bRhVetLfa/lz/7p63cguYbjoXZcpXNJyHXVQuQJ
	6myOIP6URrEOSN5vgiCn4ajSY04CLpzEmzfYuQ5vLxEHyNn0ZNwncKL/bmuUkgm5z9AhiZskQMc
	ofhw8Gx2X9I1gAHe7LudP6uSE=
X-Received: by 2002:a05:6512:23a5:b0:5c1:5209:5a44 with SMTP id
 2adb3069b0e04-5c157047b22mr51653e87.4.1794267083633; Mon, 09 Nov 2026
 15:31:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165525.011876858@infradead.org> <20261105170157.453569788@infradead.org>
In-Reply-To: <20261105170157.453569788@infradead.org>
From: Josh Don <joshdon@google.com>
Date: Mon, 9 Nov 2026 15:31:11 -0800
X-Gm-Features: AclHuK9aIglRyjrXhQ_DwNbOxWjeZRaKI6HC103Zk3dWCXQSjLR7gGvQ8QRHuME
Message-ID: <CABk29NvMcBSO_Eu3VN5Au1QjZHcFESmNWCqmD0fEwydmctUL=w@mail.gmail.com>
Subject: Re: [PATCH 1/3] sched/fair: Use guard in sched_group_set_idle()
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:12=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> Cleanup the code by using guards; prepares for further changes in this fu=
nction.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/fair.c |   16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

Thanks Peter,

Reviewed-by: Josh Don <joshdon@google.com>
