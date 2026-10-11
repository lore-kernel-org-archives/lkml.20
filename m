Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32083314D34
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748765; cv=pass; b=GKfqfaCSlRCt0wbR+FWoMcdEaAnAabBaspocd8v3Ox/vlExjEOeqgtwYE/E10vn+qJoBSXAoCw+3R/biMNnUoYl1DvRmQvq1FbGxbXhosr6iCVF3flU6LNVlub/dAIOS/Bvu/nQOCOYDDRehWDGnQn9F0I6N9ZoxGVX/KOtf5tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748765; c=relaxed/simple;
	bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h48SNJNQOZ8BNZWwiTFpx4zN/TEVbrbpbVvpLORHzTw3/M1gkCxji3kuYRXNfpjpdBvLDSbv7uaYKovNF4mL3V+rVFtAJgB5ZlaIL6xVZq/q5A54RMAsdb5id174zGhYGoi8fXlLxer7nSuB5TW5QC9bh3/PuX1VlffHVhocqbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqm8/hzS; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqm8/hzS"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9179dd18658so19238706d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748763; cv=none;
        d=google.com; s=arc-20260327;
        b=TL2XlZVCGHqxMC9xPZ9kBjwXppmu4exOOw0cJZZlzmZ+S/gUJ63kFuQmVPIeyOOvwj
         t09ceqN4nx5pZurq8fLV+8I1kxyBatOi0VE6nC6HYe0dztgOxH44bo6h2NhiorxwYqm5
         BR2tCdJa7B+ZtLGnxHnmJ8+pzD0N+pUiJzHzKbIrNJ3hjVlomF9OZy0f5tokO8Xl5cp5
         /ASgRzsndyo0MRlmBANVr/mTZ34UGnyVC6qLCqzBAOdNl2YvptRZtn6NFCpRrsyeCZDr
         NxlxO0lP1BfhxPG5+ma5H2/OjAuVFDpwHNu3+uxumgRyCefSXcnIQkFRuoBJntm19FUu
         P1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
        fh=vnK0FIW1/mvcy+tcSJFjKgT1+CrzT42QHsR5pkazJmg=;
        b=AsqpzXgusg7ts451jJUo2dyK48LE1uXuyHMiKxdyyr8l8OBHZUzsGqv6fTLTBAqiVq
         WvbRjXX+fe7fk6rVEpXegEJWIOq2XPMOvOSnueLLxDYHBdH6nBtj4YBnnj6TI+/IvJ3Q
         FQ7l6LWguQH08eyhSgWqDOyVBGBOcRXNpXiRQQaIacrHd3tca/XLnGN9Ktt73ZkMI2uR
         6lycXsije359PyEZ+dDCcmZW11c89ovTtTokmUuu1P4XKT6kVckzG6dn4nQutDC2ER5t
         Mig4ILjjRi1gVgJmrOrpDK8IIBztHx7rMKbhj+jPmim/Kmhlh17b347IynsRqV1JxGdy
         mqmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748763; x=1792353563; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
        b=Tqm8/hzS4rKcpjROkzpuA78e3a107s+n6DG6xJTyexLkly1FzoTYq9NglpQflfYgVO
         /VloHNF3G6kUxPA3Erwp7U5wbSaqma/l9O/vD32fGU2mX8Jt7bLRZqlWjRB0OytzKAC/
         mKZOUx9M0v/BlTDMCN3JOmpDgU+0yQPz9Jr+QhasAdJtiBXWSKSH450bdIMNwx0/e3TL
         PZ0NPZUehC4XOiGbTKXMHznR2MyAL1VxRwlj6KmMl+lhkuodqlxDzVllCf6YqvyUu97Q
         QnslXMNRhA4HhA+CNAGZToGMtik+lEPRJzgUqn5rUWjdnGao0idjaxLrvnPhpfZ01Qbp
         I9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748763; x=1792353563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
        b=2fJQUeaF7uT3qVv69SFLHtjZjKanECYfI1Bl2EBofCUgHXJvxpVvE2yEtRmBxEXk7s
         +f0Ix9SVY3KpcFUgWIkAbRb2NH23VEOCQu9wAPsKaovoloNYcz1PxlLnjeJOjXz7uGvk
         VGIv2evHZuMJrXf1r3HlCIN1MQUcd/0kGfOBbOrl9WJChSxUChZIdkb++X2pVZSvrX8O
         jiJCm5z3316PqQBqjRYkEZ+sjfxzCzERVnZ65Sc6o3bY6BuA0Lkuu/+qfPpAfHS6AS9k
         1M9mewVwPfztqYZxd2/TXAOh+ojdvs16tTAHJ+aPHiocfflinsh/oGZIcq+jg9hIO83Q
         K9rA==
X-Forwarded-Encrypted: i=1; AKwUvBziogt/Q9Fz4ZhP8VU7Ynk+UL5rMVY+GvWolpBW7Al/a5xGRQjF2PUhfnI1xc72TkfXmpY0+cPYytlJT4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvAu1tidL5CPp0sOiA9q1N8w/f7bLdi21Sw6xKlKv/B2MSxFlj
	nUwZDpo06uyMeYvp3PPINYXeWV73J/6QL1cTbLM66pqhIR57JX8jeyhTAWqpjvH1RyuhbLM6SXV
	sXI6dvN5cUdFXxxiit5kHjnnCIt6WQMs=
X-Gm-Gg: AYBFou3Lubb0cmb32jCnnX4/tirpMZQ4lgkx3+M1lzq63n9vDJbOCrpm6yswu19Bsl+
	vnya0j8HYZ+Bjpp/y8Nvxw1Hmqr9X3KYlPPTX/Z+y2XtboL46FgRQRD2q4TL0sG0NAkCf5j7vbe
	BxG7jpbIF0PNulRuERHi3aDWm7nIH63m/IPAd4NsBKzxGBCOC+9TCGCJ+kWMu+oKqxBxYWoTBVk
	Xkt/O3qfu1F0pEga3mAc612jZ8szIKbdx5qcpJz7B3XtFu8k9IjagEKj144CpY8/ph4tIc9Zfn6
	ERMaStOARiNxZn3sWz686uz0NlyyYUtrjUG626qI3KS/NJEFxUdFr2y+jVcE/lJk5Iyqp77b75a
	6D6N09zbHe3Y8f1jU/WDpNI8XtXtas/Y6sn4AZkG2Vimi/UI/PtclguH4SVy5RvUB4LB+/H8=
X-Received: by 2002:a05:6214:623:b0:914:4511:9273 with SMTP id
 6a1803df08f44-91b557fd224mr139117476d6.31.1791748763139; Sun, 11 Oct 2026
 12:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 15:59:08 -0400
X-Gm-Features: AclHuK-eHjqSrV9sl6WmgjGgfhm1eMvc0Cx-U5FPus6aiOV4V3nX5BN-usuhGuo
Message-ID: <CAEdQ38GoGCU_NQ=D1N8A6yiF1Y1-PgHdavFSCwyXKu3RzJ7Sng@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] alpha: improve Tsunami machine check reporting
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 11, 2026 at 9:12 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> This series adds Tsunami/Typhoon system-error diagnostics and Clipper
> ES40 environmental reporting.

I built each patch as vmlinux with W=1 for GENERIC, DP264, SHARK and
EIGER (gcc 16.2.0). All 24 builds pass with no warnings in the files
the series touches, so the err_ev6.o move to patch 4 bisects fine. The
tip boots GENERIC on QEMU Clipper as far as mounting root.

I have not exercised any of the machine check paths, and I did not
check the PERROR field layout, subpacket types 6/7 or the Clipper bit
tables against the manuals.

Comments on 4, 5 and 6 in reply to those patches.
