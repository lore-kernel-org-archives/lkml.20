Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4B3DAAA9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701544; cv=none; b=mNL/hPWq4ipCYvkXhqutAMeEflUZGvOqothi5/bu9XGPebCz9qfp3RiCFcPgdN/wRW4eAj5KPxWPUV6t4Ig/mVpS17pzJPNJSuIL8Rvqg5Hvrl6Wz1wQRVXENzaRSZ5FNOL41gjouJnri4D0Lh5LnPjFDvuUG4rRRlJtgXI6Bg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701544; c=relaxed/simple;
	bh=JV8h3XKKL4iKc1z0q0ZRCkZ4gT3Y6S4Dns2ilEa3XNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UxXqsmCFdcwNjUM0DdlFulcXCUUwoWAwl0ADvH2HCJiq7Pq73nJL3T1i3+LHQeF+eLmMNQpqVPrnY6fVkrcovbQeSxmPV7BZY7w2W2+CwqPab/LhnpbmX74U6jYKzNXWvdWAogTU3HnGdEHlXDJzGDwCOsH6VDVaC9IyUiKWn5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qk12IFJj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JSwYylKP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qk12IFJj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JSwYylKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
	b=Qk12IFJjwVhA2+JO7gFpgd4ovcV/LIurwwJzfA8rt1X2AC6/B7PBY6UjabP4kUWFIgAke4
	ofsWAyt7n0niFrKLVuIm6hou9aZcybTo69nzjiWeLcJPWS0bO37l/arz01qR0IK1FlcBmZ
	4A2OzCx0AN/iFkOtSB+Fm+56ySHtkBQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-ar10tbR_MpuV63OWPH226A-1; Tue, 29 Sep 2026 13:05:41 -0400
X-MC-Unique: ar10tbR_MpuV63OWPH226A-1
X-Mimecast-MFC-AGG-ID: ar10tbR_MpuV63OWPH226A_1790701541
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf4c0af4eso185725385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790701540; x=1791306340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
        b=JSwYylKP4AVGNASKjga98weuxW6sBvD7ogU5r9U3Uxa+f4WR7q8enhZDxtRD3gCd/3
         YQk8AmZF1oDPA7WgZNy9bLmSN3HIRP/maXNgK18zrrsy4wT59vYPzfG+qxOE5SVrNlF8
         Pn/yGDyoHj2CIoNFqaZ247pCoxXQIgj65+I5yPcGpY0gUX846GRJ5llDj21WFfbfLT8r
         PCHlB/5i9bfntQ2Zywr9AMik+qVPj0GPtp5xjiih8bqVr+uq11g5gF7nqAjVRpHur5vu
         X0r5Wty9euy67r7lptrrL4vjKAcv7iKNu1vddWs6Aa+/UfL3GTLd2DaZig/uvhqulzJz
         sR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701540; x=1791306340;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
        b=pAXX03rs70nbLrBV/Td2yzfnxPCmYsqR+Da3T1BdTBNk3aw/YT0LUrOAJjit9DwIpq
         ZSt+gcJaEDnB+SX4NolaK3p1QQuXuCynAWYdaSN2Q5mraZxFto/VnAnk9o/gUVuVs3Xn
         /s0uz4dOerMo2fSjIPL4nZvx/tV3/RJBxuXH1FVftP4WUuKnwJgoLKvOFSDo7Su7VhRX
         IvEKNfJ67HlM9bbXVy7Ed07eBDHk5Kdn1A+7ycmvt/pdOUmQdbnFJSvKw6zHXW6rOK0s
         3Rh2+wqeukjCZ2ClIpJY9Lw39npJHpWS7zxuFWAVeSqkZIBfdqHmQK1BpEFS2ORhQaLE
         YW/w==
X-Forwarded-Encrypted: i=1; AKwUvBzznDd4JuwjaJeJdY0x0gJvku5cZRl0MQ4fL81hhRj4QfNOzwDcWZZ8fHiUjMjTaZtOOUu5WdRa/k9mDJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kYETIjKbPrqVK5TTREZwoHJvMUQ1Ld2LilQmoHWAdm63tD3iKX
	sHVOn0ZJngXY3I6A7M0v2SvShFkhHSv22WkCNhonOqkMsfq12N81DAZdNYlTlojkb4SodrJPp7S
	MsV03i48TX2+Zv3QovuSQtN6lkBWqcLO4dfbWM0lrUAmVNeGiE06laiIwZELacxZnyw==
X-Gm-Gg: AYBFou08NaDxqomnh741eBy1iP6M3Lnd+sqdAot+cOuIZotQ3Am4dtf/v2tqLAcla4P
	yrL4we36rq5FhKdxl20bPoULGW/alGYNFOSUg6iKlK8SQ84byg1zb3zC2nr0nQIE+SsiqGrbWYZ
	cC7Buyl6706j7mjOx38f2bKu5k523gqlBliND18T7ZCDwdhkMpmAVJnDxiz+7nSHtFlC2fLZ+om
	yEyQsCqUuj3de9ur6rtbrB5QW0Brl7YVzux9TxE8Ojxdl5lRreAuPCHU7vwFp3PZ9Q2b7wDVm9u
	mmDd0Qx0hg1Hl3qcoMnNuJiCGN0ofit974ajDWjZymocF/qHZn+wlpHFbkKO+C1Pg1s8GmRGwzV
	lz7M6QfVN7/uPrG2f9bm5f29Bw9kR9pYKYEI2om05akT9FbYpTOc=
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25257485a.25.1790701540255;
        Tue, 29 Sep 2026 10:05:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25248485a.25.1790701539617;
        Tue, 29 Sep 2026 10:05:39 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f541cfasm14451085a.38.2026.09.29.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:05:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260719214349.734351-1-rosenp@gmail.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Message-Id: <179070151857.199845.8103237122518687447.b4-ty@b4>
Date: Tue, 29 Sep 2026 13:05:18 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=273; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oS1ZL6IKxW4hwmHG7GbpdJ7kavjzT5ERg1L4wiG0veU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v39wNLTMfKFGZMxiweX9O+933NBfv1/6+p+T/DNtz
 EW3HmRw6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi220YGQ4tX3Py89/Ee1N+
 vs88PJ9ZKPPO+wfFNtIVaaacdV5vVpczMqw+96OJZcb/Txn7FTd4np/zIujURX8e388xaxe3XFl
 2fgY7AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 19 Jul 2026 14:43:49 -0700, Rosen Penev wrote:
> clk: mmp: allow COMPILE_TEST builds

Applied, thanks!

[1/1] clk: mmp: allow COMPILE_TEST builds
      commit: d0b72c88671b3c46342bbebc9b90280890436c98

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

