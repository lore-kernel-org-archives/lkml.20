Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3E542050
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675118; cv=pass; b=pcanG9K3auExVEt+u6ze7+IPxkGVkMzfU7st5wIi3QokzvlFjtdR211VnEch6WptgQXwZBgR4qZmvie7IKmbz98JP/Z/Tpt1azW5gWgfV8PXRvVHszaT1ZyynIE3xmC8X4WNYBRfOZ/AQg2P3JVcis/z45BtcWPibmAY5LBdYh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675118; c=relaxed/simple;
	bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Me1azLKHXww6J4jNo/U1TwE0ZQqyoydg3a2RJvULWN91BD2HjAQlKi3HsQpr6tqa1IZ5/GYZY8vozxB/aD5bQG1QzsI3ocm3mjUqFXkr7/uPyjUYC3rRDPnlFBO3c2VFPur5AiWaaA8vzBApldGZUFllSym6jRdvfitb0QE1+sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1JN5Euv; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1JN5Euv"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso6273691fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675115; cv=none;
        d=google.com; s=arc-20260327;
        b=JyfcIZaWAnCGlZnBQEKem2+DvgeLeEm646vDpE+mzjTxLCq81IC0w0Rvw0JXAcXuGF
         FIfLopLQkaRywNYvxgwrz3lJOowL2aektECghwLWAXW0rsLM/7Buxx0qlslOTgLYQ/wu
         DcB+YX/rUpllnppYWsLBXLbtpsQeqfnQo8Ze2KC+aQB7iTTsjaUF5uGOYRkCly59wyxT
         bsPGs/xaJAID2VhWyB3XY+ME60K+wIL6DD3beJGa/94FcdY/40WqqmHcEJYmMT6+3EYT
         /r5o9JyJ1vCZenxoS5wcADPsz61WYXcpSLTzLIkW9KIyCnYXHXLrtwMbVkG2aGWEa1Yc
         0pBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
        fh=82ds8xOAWWzH3R7DjpZnSk6o2PIvDThdzOzAXQQASlI=;
        b=WON0w7dEYAYErY9lsR3Z5vW915usnJO3g9J/LHgzSLK0Xf2YIJJxd9QSUIkujSMFbm
         g42kLJI5xgfWFRyJDycFZaJvxENbGeUkQ1zmYKCTvZOeDyHhludGoiRCuADlEREgccQZ
         P4BkL2MiF4BlXvqpcY0l8MqAszMUMLQAZSELprsvrhgVG9Rz4S3kWywa3QotZFAwhmHb
         Z9hPm+itbnZX4poyKNF92mEq3kEbBJ6oQC76VxP+5kCD2aVvlZrHZu/fLfQYvWGY0npA
         P0m3QF21PK0hAOSshGcwpV3NDu4iSPFLttzZPnFeAGNWqQsSBR/xUXR1I98Pjf7kkpPo
         7NbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675115; x=1792279915; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
        b=m1JN5EuvaWvOQt092zbbaCt5FUlb52kBO5D1rWtIm9D3Bn7FdErO+HvtMZkWhDVM5X
         /+fpo5gJ986gXJY6qY7vnoRvIcbnrLcosDgHEwAG0aRk+TjaePYV0++tqxk2L26e4EO0
         CbNUfORcc+4u0ITaLLrP53Xsjvg0YJwo1w+olUjF8cAjJgVQTcz5JQart6MnQjWh7G8S
         aharZAYLssFKCgELUd3HP5FRuP56tYx/QGWyfhXPj6zY4ca8HI9QZKGQYGnZZv0Vh8mo
         sf9qmi4WczPtb9LlHjlZTt4t9mWZuDdMQgwgp5RJFSx2Hdupk2QBPBDMH5DbD/sksOlO
         Qajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675115; x=1792279915;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFpAteAUZn9IrcCuDJcGIFnH0/o0CjJTaZfJnxzPdz4=;
        b=lCyPff4cN+5P8gMwoJ8Qr5UWYXG/6Gw7cNcnREsy/Ve3LiyGYKMFq4HOPCXWUdxyFt
         SidDCmCNhvTUZMuJcBciFQMbu4O4L8YzjRS9LCMMYDBWqiN9czYS8sX1bCDiMNAVfWyT
         IdEjzCcw5t+S23NJICqRCbNUWV3xTRS8Ixh6YRFQ/0vabLfQbt0/pDibe2G6Trvu0laF
         AU4Ti+GLXtdqLR9erOd0K+V/Ld3hTktDX2tGQLmWJG2XvmBvtLXvT64oChXVZknjyEqf
         l6CcQrxC6qyYBApXX9wjV1whreIhR9NsaRN5MN3GI2jZcslVpXdoNbJRloWMYl29RvwT
         xmPg==
X-Forwarded-Encrypted: i=1; AKwUvBzWs2QKO9fTY5ucbQvzrTrvFNhmubdWqS+ZWB+fQ5obG023E84xD5FcpFneuYjV4PtMDxM6JmvU/0qc+ic=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9P8uRHkOyz+foVkAhtW4NoOMZHMWdoa/uZlCZW00wdXj/9PCY
	86gpA3tqXFyKSqUTRSqkzf28g8uEpnhFSKMN5iON9NtNOYTLknd9N/sqDtVooJbL/5jYajjp/JQ
	w/sAqcNH3j5vufENjLCWkz1MgCULGpN0=
X-Gm-Gg: AYBFou2mcBJ3cbLyveMbnY7ugM18kexfSD/Xyxrd9QptkIGaoWTQZiTFAb1rI/PgH9H
	nle4kPsfdZZ0/4lTcxgDwZYpYyRvrdbE7WBcp1Z4j5lQGjUC67O6XJgsbkuHZoTdDsnN/jxXnYI
	iRCIG3zSU+UzUiBdB4uHuzMuDz5HbcN4cEKpdYwMHBzELmXAKCtWMUKHMpB97FT3E/c99C+DDvj
	yo3/dMAxncAR2qIcXkEdmxouZl72dd5ebp9HmxI7QPA893I24POUrs1UjZyfe8+LGZ1pob6+BPK
	IdFJH/4dff/ZXpBvyK1IIeuUsKkd2QpRSS1AOCw6FNvlQJpVLxh4jIBzMXF39a9RoF6bCoqUdmp
	xxTBCDQ73q55X2SeA/E5pqEo3IOgDYQwwnvrsXzlCl/n2w11Pv88BdXRdk+14b6i50QbE/Z0=
X-Received: by 2002:a05:6512:68c:b0:5ba:3ce0:b238 with SMTP id
 2adb3069b0e04-5bcde6bdbf9mr2126458e87.14.1791675115014; Sat, 10 Oct 2026
 16:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com>
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:31:42 -0400
X-Gm-Features: AclHuK8RhP007QwlNSomugXG6sApSgHBnBl8o8egWVZyxoHTrRnisSv515sGeZA
Message-ID: <CAEdQ38FaU6Wev0UCRdWqqsn_2faymQofNqsVOW2tbB=woMyc4A@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 04:24:26PM +0200, Magnus Lindholm wrote:
> Changes since v4:

One thing in your tree rather than in the posting: the eight commits in
for-next (7500493539b4..29e34d2b1b87) each carry your Signed-off-by
twice, once before the Link: trailer and once after it. Worth fixing
before the pull request.
