Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B573793DC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458548; cv=none; b=WqkvLX8J/yxiBFtVyXpTTreEhSEHgWJNLNcrK27RskicmU+CiQwkDpTCb2AvksHmxkZohVS3cuIkm+I8XFiV1mEe/MsXZzaBVGiYQFQlyowqR6N4jzP9iUdlgmXZdQoBZwwSDWVNfPru+9rzyQtRIfGVkvM1PkipNQlrUwF4KIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458548; c=relaxed/simple;
	bh=pOvhPlTL7QJhMatKQPnVADUYiOtOm0sxgZCmK5Js7YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvX559LCSN/m0ChBhxftivyQlmJRfwW+0Lq6+/n1CjSMlsGd1B97VxYs1eAnVMzjXbMV7x469DBjfiCQa4uSFtOg9FNZE9lYluDQwryY6DWnU2tCk4fZyZWbq0qYccBocoPoFUdR0cz3UGFZtqBdya6+fwDfkrEu6hzqqklA8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lwgGZ+zS; arc=none smtp.client-ip=91.218.175.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lwgGZ+zS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pOvhPlTL7QJhMatKQPnVADUYiOtOm0sxgZCmK5Js7YI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458545; v=1; x=1792063345;
 b=lwgGZ+zSFRnCW33x/TE58PMQHzEhivT6T2NDpgz0APfpv52mwNSdW8/+AE4DvpSmkyd2zspg
 BV/4PakEZH6FIYxOZtAeTbWoaEIu3f70dnCKYN0W8XMOmKiOadcKumODN5BCCO/J4rn8IjdknAd
 znfJI0uroqmz0G2XJULQzA3s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a44e127733a13bdf;
	Thu, 08 Oct 2026 11:22:25 +0000
X-Mizu-Trace-ID: a44e127733a13bdf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5965e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGjsiroBGF6WfRezC4qAoo5heIESSgBLni7OgqlkVGuutG+xNKToqaLH3pp2K4U7wI0W3uLcmeFRZFEV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX6xLGkpHzaBMV7HuhmkCrr8hTiz3FI5GlqeILTKSYy+buPpfz
	fesXH7uRWmFKZIF/agMLkYcdsZMh0INBbVfyyiFPYAMCLoPzpq1IZRmBGzW67b9DArxgIH07CXy
	g+bqY06X+014jJSmHs32naDQO0FwHLjuok77fKq5q
X-Received: by 2002:a05:6512:3f18:b0:5b8:c932:f056 with SMTP id
 2adb3069b0e04-5bcd5883333mr108768e87.7.1791458544264; Thu, 08 Oct 2026
 04:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-6-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-6-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:21:47 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwfzp3PdsNe+BU572rvnR5y90D9y1x0DvkzE69Tycvpmg@mail.gmail.com>
X-Gm-Features: AclHuK-DqSoZ843rAUwPyVhb3bRlvEHte3k5TB9Sea6c7VQ_YeL5anSwTJMWhnI
Message-ID: <CA+EHjTwfzp3PdsNe+BU572rvnR5y90D9y1x0DvkzE69Tycvpmg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drivers/virt: pkvm: Allow granule larger than PAGE_SIZE
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Wed, 07 Oct 2026 16:02:55 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> Both MEM_SHARE and MMIO_GUARD now support a PAGE_SIZE smaller than the
> hypervisor granule. We can relax this restriction.

nit: it would help to name the restriction, i.e., the res.a0 >
PAGE_SIZE check in pkvm_init_hyp_services().

> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
