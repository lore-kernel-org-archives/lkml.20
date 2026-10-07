Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274223B27F1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355563; cv=none; b=AxCL1JorfWnk6IfgqpbeerS+7XxuosIW1+FGjdyg2/vQlfTIm2xQFG2kYeuz6I9t5gohW5PXDYFcGzlGn1xgwGkfDPpwtpDyX5IVfj/dj0sJGjO5rCMuHleco+CRvE2WFupBwuAf6fu2+ObCialW7D7pKrNEsg5LtWPy29SQE1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355563; c=relaxed/simple;
	bh=ww9Rf5+zUd3I8lKgj7ZcJpBY3E+QqurY64TBzZF1pbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7IYFEgFkHc3UMMP2FlRRWtcp7QkvsX+MuDVkwVmxQGQFWmJg+PE+d6eG4zSahcaUlorDv8RGHNHsbF0DYiGW1wItYfBSacNpGDw8nHDQUjP7dZqG/AfojJ+60lYwK9moWCUuVzrO0uKCXQUll0ynGayblmYqtdHKreTa0lBPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZAyDOPpA; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZAyDOPpA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ww9Rf5+zUd3I8lKgj7ZcJpBY3E+QqurY64TBzZF1pbw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355559; v=1; x=1791960359;
 b=ZAyDOPpALGUO0dUq/cIFjMI1p0bK4rB5UJRV09IrMZIu3hsDbYvOCf59QW/JtOgPR2U6CI1g
 S6UNLINksjsXvk0FNZfpXZs6R4IGwIHnqJAgi60SRbXqeNAYPab0cfv0P/urn00o0wPxkJriLaZ
 oZcZTQTCOJaTUDRwnKeb/KyE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6a47b746f6335f13;
	Wed, 07 Oct 2026 03:23:14 +0000
X-Mizu-Trace-ID: 6a47b746f6335f13
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so4656e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx7HWmupnJlcR5utdeWkEP3WHL2lPWgidR05WaZ9Cog+IPqPu/NkI7dorBOqMWUYxOFvK+aJRaI1EEpGuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZcKZVQu0v84uBhbKZXoSzq0qDBrhNysB5vz81+UYST56E2y4R
	wLG7KTzMdCxwM2Rjl5LmtCyxeSt5q4XUjIwT5kdh7RyLqE2zeOumVucKx8yr7ZXG9On5CR5gPk4
	AtFY7559tw0ljlnrJioSvEa5nXViKZ43q684Sv5eb
X-Received: by 2002:a05:6512:6c8:b0:5bc:b2ec:eaee with SMTP id
 2adb3069b0e04-5bcca85f534mr214600e87.11.1791343392083; Tue, 06 Oct 2026
 20:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925085000.753400-1-fuad.tabba@linux.dev>
In-Reply-To: <20260925085000.753400-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:22:35 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
X-Gm-Features: AclHuK9fHmZtY15hLIVYOST00PucFFzd3kB8VTW4flihZXSNcA5_glFGRDx4Dpo
Message-ID: <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] irqchip/gic-v3: Memory-safety fixes on the probe paths
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Gentle ping on this series, which Marc has reviewed, and on the
lifetime and range fixes [1], which he has also reviewed.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260908142632.2795308-1-fuad.tabba@linux.dev/
