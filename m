Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9434F68A4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894742; cv=none; b=Oy+rO/kkYpR357Q0gRetxaqD6nK6BzsNibFsu84M3WqzhSyFFuh3WgNLFmwa92v1K9655DxrhUIxOWkiFyC/7ZfqSnaA+L2voxcdcS6fcSWRtsOQs0g6HAyBO2XawzmufEUq+D7pZggvPKwMDzHzW1EZnVeB+Zl3sNxvBouFjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894742; c=relaxed/simple;
	bh=r1I+/dUgXdXoKXx3z+8GTM3jiTR6PaexHOsBVmIF1fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfE4VTngNayj9ABrU77LYUGwguxfWbLT2UiSTPDwlWFrKXZKcSmgAmTa2fT2EJrbetqmVAQeUyFOhuKZDR0W330x+gGXxxQsdt519VtqZGeabI9NI9nZiQpFlvKBzGYA0yFtaktWHF7tTIfSRiRwR+u5tSsXjgea+UiqOGCLEuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=INTlmjeH; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="INTlmjeH"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917997ab0d9so37674026d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791894740; x=1792499540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1I+/dUgXdXoKXx3z+8GTM3jiTR6PaexHOsBVmIF1fE=;
        b=INTlmjeHEMcGqVI3/TUa02j2O+A6HTw3pSnAbl8YOa4VI7rFWh+Kaaf6IiRlFFcykU
         hmPmjBEczKj9Pfn5wiBw7m2+LEWOKBXCbqMb6Lfbx6GnPAa9eAEMFupkdLDHfkmfD5Vf
         t8wIdbm9fzNuxohqh6P1XELvtOun1BmM5QFEUDJQ94qVp8gREoqKvTYFGNv9qIz64MCJ
         o+zMAbzzX0Rsp0FOBS7txUWqm/lL6McsO+9cNYC8rFqiC/7FxhzpsDx3xsRYQC2vHuVh
         Gbz5SOKbYBrBgOIAt0FAko/vaA7ghb/VjRa6h7wegOEZ14yDuoookuYjup24DlHac6eP
         u/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894740; x=1792499540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1I+/dUgXdXoKXx3z+8GTM3jiTR6PaexHOsBVmIF1fE=;
        b=KvJxHRmtCxeb+/Tz7VLB2IZCumOV3G2fvK6qWR1xPDGLBsJ6Xr4My1TI6bGcP7CjGN
         /X7dH81BmdZcoE+q+d55s5g7ANWfIpWG6FjK1e7O4XexIVzVNhs5cHJwKBDX07KvshBM
         g2kKEHKRGGqh0h0f+98NSes9IrUVoQA+51S7/zqxvW1seFbelKBaILotbvgAl1GlXe2g
         DE9jGCyh/icp5Hv8ClYec0VHOeKAjswIwzMnzriz58Vwu5NslFtCN3oXrReYt75sSpFN
         063+stGFCo+OQGKutudpBWHmFPV6vhISQXmlF5IyuPzpfhxUr+NL74JacK3QvbnhbG4A
         uYGA==
X-Forwarded-Encrypted: i=1; AKwUvBwwJ7FAp5eMQDXMMq+QttPhRDgKEEXhDj781Bb6TcjASDt7idHGffTz8CEymhEik4d1Tm4GcYAp+1EWUdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdwvcj5fcS5FZVB3nq1PaY1ye3Q+fjUyf6IVKYD/ZWkO/YyyQg
	tc8BqrFcIsRGQZyvyCIjK0+YXN8+Wu/9913H+p0lY1Qfe4c9+91T4sBDnT7zRK2rgNM=
X-Gm-Gg: AYBFou141qZT5TdDSS5vTV9si6GfP+51KACjmjJWOmnlvprsFYamX14IHSm/gHLTE7b
	aNCPMQv6p3jeOyqcvHAuXUdYQn9EuciQbVz8pkXyo+VbubuNCc6KWP0DH9KSV7x68tmd+n7PeU7
	ciNq/QitQfu9o3FDbjx1/SNGqaRqB7+fSt7WboZlP/QwX5dHEPcAr0e2m+IN2UgjEB3iBbRIeJz
	9cXPNTXUBkzhNBhNPrnn1/fBshxfrC3/zwfyYj9ddr7IMZZMDR63RbCWRQstmF2r9s5tgqq11z6
	4DLjSwO48Pj4KgLPTCM77yCkK//omIONY11/r6BypWDkq1MHiqf67nkzxcEY7jUazYi3wFZ5iOp
	+BcdnSupyaprnuLJB3BYiklz4cmmMYwuL7SFvOPH45Y/qwWZt9sjQvAOadizM7IGVK0RVeMCECT
	RfIEX7To1gpftH5zfWH2T5TG2XAlWXkZOhOdyEBGMxSimP5frpC6kX5SzTs/daJR7gx7zPh52uZ
	uSqk61hO0+OpMpdTPm6b/z6i+8Z+Ct+cifOAKD6ylSilqxlPGuqe7jeqR9XEYAb7pHutxOxlDVA
	MiO02R3alJ1kSktNlhKAT7C7+oAMfwcaI6SCNUJjG5DRO3OXXXiR
X-Received: by 2002:a05:620a:601b:b0:93e:6a4b:3ea6 with SMTP id af79cd13be357-93ebd1de502mr1974484885a.24.1791894740177;
        Tue, 13 Oct 2026 05:32:20 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef502608bsm226220585a.25.2026.10.13.05.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:32:19 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] media: ipu6: Don't require an ISYS reset after stream stop on IPU7
Date: Tue, 13 Oct 2026 08:32:17 -0400
Message-ID: <20261013123217.17680-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013005048.8601-1-j@metarealtyinc.ca>
References: <20261013005048.8601-1-j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CI build failure is a base mismatch. The Fixes: tag made it build on
the fixes branch, which has no IPU7 support and no IS_IPU7(). The patch
is for next, where it builds and was tested.

Jake
