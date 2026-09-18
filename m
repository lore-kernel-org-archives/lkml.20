Received: from mail-lr2-f25.google.com (mail-lr2-f25.google.com [74.125.230.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F4F4F68DE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745035; cv=pass; b=X+Qjz1Tn5Oe8WBTBCaGC3QCHI0+nSBzaFVeA8iVSPZHf2WKAkxS76Tpg8fYvrYyWGijpxxLXiJm+K/JxbAJCd0nm3bH/c1EHU/fvl+sNUjhb37iiBB9RuJgYoKGlTQKw3ihWA4o+GWnVPDAm9ppYYY/vREU4yfEK4MAQLyMzTM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745035; c=relaxed/simple;
	bh=+A907ps0OvgW9qmIZ/gkLQ92Dib2y/unczUul+r1qMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oy5xeERQMqW4Msi+gAHprtcb5+/hl9cOFEl4zYpYfx1NqGZtDIjLiX9y53R0oA58XSnkwfmWRIRVyO3C7pUR9olfAGOXzlMAJYjOkVuRzrg073O8BhD1EU7BdsQ+Lve1ZnoLFSvVN7AJyZHYk+D7/+lKXmeGPFEhr96V+ghoDnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F4PCi4SN; arc=pass smtp.client-ip=74.125.230.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F4PCi4SN"
Received: by mail-lr2-f25.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso9535391fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789745030; cv=none;
        d=google.com; s=arc-20260327;
        b=O18MLlbkv32ixhLjojR2jPio8WEfTsBfXvq9KGN8C4F02kF/wthEYvrM7KwicNslpf
         sOogHthZ3J8wTsijbDl/Fv5BeLKgmLDbRqAa4oPE5B21bMsTRTNh/HO4NrbWEvqWwiQT
         31f/oPGmFsCg/zTuj1bXWl+NRcN35C6P5B8Tf5I2ybgPJWTK0Q1jueMqKC+F/XgBT1GI
         X3YxvS4aEh+tKEHk7fbGTl5xxW4jgl79fqlMNtuzedGz3LT3iRBZQJjDwwpPQX1BpCz1
         W8pp9qgcS5dszXZzO3U1l7WohnSODxj32DDwgFXSlk0nCyok+AX3q6xKeo8tMCj73EBx
         if1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+A907ps0OvgW9qmIZ/gkLQ92Dib2y/unczUul+r1qMk=;
        fh=g4UDRYtbpS3YYo+WHQ7FrPmtobm0Htd1kaw7Mm47yoI=;
        b=RSjso30AGJ+pl6gJ9Xl2AQrX+U+zmjpqtXnBLyK5gNYMzdqXp1PcOqKiHn7i77Kv2s
         R3knhZ5iIAt0NG9zvsrzw2ehCe0hzp4KHztndnEEzC4/dhufG661xsTKlNl22HnepzPJ
         LWGzkWiKzkrKRodpduVTdYmkarVmpFLxU6uEs8P5HpJJlfOnvOJEOuqiCjuiHn9WPMVS
         84t4hr59qgodZ/aEPjdQtRxVE1aUQGWtgSuIgnRUVNxMSGnnQ+wiOTIh9aiAEiovdBzC
         jN0SN9loe0LotxSwSsBuvUBuSoG0kdfPSXF/cgqhwUtSYekju2ScMMh9gT1zpzRnp8Hv
         aSuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789745030; x=1790349830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+A907ps0OvgW9qmIZ/gkLQ92Dib2y/unczUul+r1qMk=;
        b=F4PCi4SNEoAoBUSqRwZOPxn0rHxKyV5gh4m9w21dBNRQWm49PpcLTp0y/6Mq/4kDXv
         kj+S+C5ACx8Ojv8cp4r14khV5KB/BvgKYmtehEKZh/h4XrVnwoh+DLDrAY0P3Z4ynNte
         9NwMFQEH3Qe+KVyGeQ7l9wLq5rLgurIBZx0h/ycK1g29TOUyMRVmvL+2ijY0xKsxyY4C
         H6Drks1gKMS/qfTmPHAQkf0Lc/gtIt7oREgvptJ2yJ51zoMi5C37oCQKEfsYnWqnxN+7
         s9TX3ZaMoYKa+sejdNTRuSNoRW4RwGNYnquL07Ji/cj3V6r2XdfWHDQCvCz+O0/l5war
         civA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745030; x=1790349830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+A907ps0OvgW9qmIZ/gkLQ92Dib2y/unczUul+r1qMk=;
        b=zS3iS12zw9OGtWlOtFbOSSI3O/GtQiBcJD4F+PryPAvUU0uRiRmJyH+d4pKuauOXFM
         f1ur4tjdVqetwoyiu7pVsowCgYWuU9D0yHDJDMncS+n3XZip2bk8QRLpVk/ghvSfgUK+
         5VLmEmX+gIBjtoqeEeQ/mFlIWo9qdkrQXzV+aArnpIKn22IM6v7a7yr8gfSxVofknyuK
         H1P48TmR22+CUAg6CfQS9ZiXlKMXmuzHI24Stefka5I5nLwiHd6g2CBrws0iB9ATEaJF
         a9u0KALezTra/rZipcooVsYaWh+QDWcsrvu+yKPP1/OA4pFZAjg0jOL276DAGHPrBogF
         GtSg==
X-Forwarded-Encrypted: i=1; AKwUvBx11m0y9/9wpFm2CgvcIGZ0MqoxEI2ol4t04ggtQhipkTrFhN7Gv/c2du1weuM+dQU62TJPlDb7kKxLjDI=@vger.kernel.org
X-Gm-Message-State: AFuF++nq6E+Y7aImxKR2DkaEw+BfivGeopZI/2jqv/az1SoeoHXwLuIS
	QZbjQlAm86rXyUo8xc6unEAMxse/c2WdQqLriUUzPjbgDwmVMMWF+jBtcQVfHtCukiuMHCM8x5Z
	CxKWTw8dH7our9oDC8K9lnxG0aWpwpvjH2B62DqtR1g==
X-Gm-Gg: AYBFou39pXlCVfcGMUrrmh2k1eQvdWNbZBAr9Jq20xuhpn1gHRw7F3XU7WMMP8Q+vRn
	d1jP80rq1gfGSC9Roew697A551bQRYv4XUkUeJg4pSL1Pwj9iNT7zwWtRFLvZsvc3uDgm/sRQ3N
	Gr/9atFfGUgccCMKpBOwhS6dKZUNqJ1Pn9KXfMTtwneNfxAaHJVBi9q/mdEenmMmPAPna1+WUH4
	ST/+HfMACKl5rxWS5qKuH9IJZF0LI/Tda5LM1hU337utkY2ud9n/nsU38k8JNNIJHaDDuMb9jvy
	35aEXxvQTaZMVRSZTFp7TklePz9U07CAHA9DCyZHnA5xgeZ2MFKPIYy7+68tnzZKt+WmpKCmS5o
	Eey/ZPWDmIzjLJLX+QZ7oXnQ=
X-Received: by 2002:a2e:b8cb:0:b0:3a5:f041:d7c3 with SMTP id
 38308e7fff4ca-3a5fbfe6b1emr6793651fa.16.1789745030361; Fri, 18 Sep 2026
 08:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
In-Reply-To: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 18 Sep 2026 17:23:38 +0200
X-Gm-Features: AcwNN1VqEsuDF4Fn54jMToSR2ryF3Q33Voj6xcxHRXJ7DkDQtD_MIEaNFYoKoHk
Message-ID: <CAAofZF4pM4N3MmCiM-j04OG2jYYjzwF9z5_BBs7dM-1utJZT2A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] workqueue: Take the pwq backend from the attrs
To: Breno Leitao <leitao@debian.org>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Sep 18, 2026 at 4:25=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
> [...]
> Not done: the switching itself. concurrency_managed is fixed when the
> workqueue is created and is not exported through sysfs, so nothing takes =
a
> workqueue onto the backend or off it yet. WQ_BH is still its own path
> rather than a third backend, the static per-cpu pools are still looked up
> outside unbound_pool_hash, and callers still pass WQ_PERCPU rather than
> asking for the attrs they want.

I personally think it is better that way indeed, with WQ_PERCPU present.

I started an RFC about WQ_PREFER_PERCPU, still not published: the idea
would be an unbound workqueue that can be per-CPU (using affinities)
but without CM; so when CPUs are isolated, these WQ_PREFER_PERCPU WQs
can act as unbound. So the CM flag you added makes sense to me.

I tested my code a bit on the wq/for-7.4 branch, and it seems to be
working, but I will wait to see what happens with this series, before
sending mine.

Let's hear Tejun opinion about all of this; I'm also interested
regarding my series, so I can change if I'm not heading in the right
direction.

Thanks!
--=20

Marco Crivellari

SUSE Labs
