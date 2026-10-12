Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31574D179A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832220; cv=none; b=GgwUQurpe7tHBSaETmJQtf3W0kRgEwGGmkfSOpeuCuZI6FjZLZeGIDBelGISGKWU5AKePxv+kYlE5yf9PthBSHHteLLaetRZBBvU1spMVA0EMEG8IIZlmXKWWEKrdaBxiyqbI1kuG1XTcJN9qHxVQuJiau+71iskmiIiN03JbPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832220; c=relaxed/simple;
	bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=En1VJQBPgA/AG8k9/rce2eWUFRBfUOazpq7C1MZP2Ev5O0GFv+Cmb4jUlXoS1ZlOwLfRboxBYd1TLFIb+YRfycriTkpHXs+uPoKQIEuGIxEivh03rwSKvHRl950Ge70hFkURaaGR1nNCeCba/qLK5OJYZMFQKFXQDQU80Qn4X+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOugOiSC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOugOiSC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1546791f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791832217; x=1792437017; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=NOugOiSCTSMWU0cMd03TBYvIYlf1Jup6TameJJ/jlAiOUqVz5AEzKcj1wh0nrfhoBP
         K65eFJ3+E+qQXJ5nIs17eSlpUtmPtj/H9AOpsgG65N7cA/97zmwM85UbhEPBe8IybOxY
         utNor2haU2ekldstbHcxkI+I5d/CuOwXxdEs8c+PF+QcSM2V8IHKPY8tGCw2KEs3svwG
         3dEtw4zX5Pa4XKPB9Q4J/rS8+qGSg8/Q0iWQCSFMPOpIOQ43T/1DHUOWSeqq0x/p2OVu
         EsdwZ+JuHO9Y87Z93/DC8XkozO7xZZiklUfJI/SSk82y96QVosiaqM1F0RgHUjhmd4Ui
         l9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832217; x=1792437017;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=igyLsp6MCGkxRG31Z0FqsvK+VAuNu5KaTtIsG5IlXnauyFBgT0/myfttgTTmGu6/IO
         RWle3MbKO8mw04iUUIB7z/GopDiy1BuBidD4goTvzgsLd1KsNbDxI1y9ilJmaAAfOdWo
         zNZnuw3d0avEHn07nnTBFZrxOjPqokOM8XWMiYUJMhfoYO0NKrMV+lhV2HBEF0Th0jDm
         KPt+7+4HVleHYKRul0h8vpelcHISoLEv4ZQAQk7y1a3mxQtczVnuET4hALJc+fKjrgvE
         NfkJjCzrs1QFfENUIw3wOr2LHy0Ku8B3KgGiaXMN8PzdLI/zkVOhZtNoBAloiPmqqh0J
         6bRQ==
X-Forwarded-Encrypted: i=1; AKwUvByFv0EM4iENn+65KnGcaLzsdWtxghD5OQHyCU5ETCM6BxgnA++CvBb37QpKADMJ3MFdyAOUmekaItkNEdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiDGizAjrFppVZP98eEKyMlijQpFuayYMRT1P7i45SfHTbdDaa
	ZZF3A+acBBcy1B8Z+BovbrnBzdH5lY3JqwmHHOw7x5F14LfEW/40DKP7CLxM13AY5SQ=
X-Gm-Gg: AYBFou3ywWcoREQ5jPQsYtdS5hEkVQwt0WnIT02mEcYIkAVHo8YZAuZ6OvtidVYNywS
	5MgB3ueelxfys3F3OBBaWaioCErFQf0UVCc9GQn+qKsv0NNbDINuK2lknyc69GlHBewLrTgpkWz
	X8LJXl7CulN35znU+VemA0CNyX5QIbUdZN5ayRNICH+d0q7TxxwjrrfDm/O58RF0GkjRU3zKhvq
	WpgEoWI5q29dSKHzX2B0xRa2b/FKVaVe/PE8v93O20bQ170uCS5nnDJO36gfgt2yWtAM/jjSDV1
	OK/CYzstx5FS7iJ9kBomMIazP6D6lzdIRrUi+U/9tRWKsiG0iSMHXPXVvlo7cr8ojA2ouTn1LlQ
	XvhSDaqXuOIBRIIuM6PiU2x6MQqrbNj85Rwwndp+7UHytpth5NIiU5voZoUoljzJgc2Df+vw6hk
	klbhdb/FfZOTnrV1+yLDrIHP9igFjObpbTYqT3skiTq1/wAHBMw9rSjtRpvSidxtbagtYOGOsTQ
	Nk4WaN4EQzKOZYbHw==
X-Received: by 2002:a05:6000:470f:b0:48b:74b:4ce1 with SMTP id ffacd0b85a97d-48dbad00328mr17013251f8f.32.1791832217095;
        Mon, 12 Oct 2026 12:10:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc91e2sm854527f8f.55.2026.10.12.12.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/4] clk: introduce TC9564 clock support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012152408.3729237-1-elder@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
Date: Mon, 12 Oct 2026 21:10:02 +0200
Message-Id: <179183220207.266355.4262660703229090399.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnDXqKk5oKeaK1dwRzL8wylpbZcavZWlv3/rw1Mnpff
 av/c/zoKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESWOzH893h4YJK4smjWDC21
 a2bH1i5YW3SO7U6qdqymb2FOrUP0Z0aGzV99tOwevdI5kM+o35D3p9jw1hGRoy41nO+2XlhzLsy
 FFwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series adds support for the clock controller present within
> the Toshiba TC9564 SoC.
> 
> This SoC attaches to a host system via PCIe.  It includes a PCIe
> switch with three downstream ports.  To one of these ports an
> embedded PCIe endpoint is attached, and it implements two PCI
> functions.  BAR 4 for both PCI functions provides access to the
> registers that enable or disable a set of clocks.
> 
> Both TC9564 PCI functions can provide PCI endpoint buses via
> devicetree.  Each PCI endpoint bus provides access to one of the
> function's BARs.  Subordinate devices (like the clock controller)
> can then be defined as nodes accessible on the endpoint bus.
> 
> Only one of the two PCI functions is permitted to define the clock
> device node.
> 
> 					-Alex
> 
> NOTE:
>     This series is built upon linux-next, with this patch applied:
>       https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/

next AND a patch on top ?? you are not making this easy and this is mostly
to accommodate the DT change that could have been sent separately.

Basing on linux-next means there are other deps and you just did not explain.
This makes it very difficult for me to apply your series if I wanted to.

Next time around, please send a series on the clk list with only the 2 first
change. That way we do not have to cherry pick, we can use your cover letter
for the merge commit, which makes it easier to provide an immutable branch
to another subsystem, if need be.

*Clearly* list you dependencies if any. Please consider using b4 to list
the pre-requisite.

Thanks

-- 
Jerome

