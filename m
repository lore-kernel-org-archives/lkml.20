Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4D3ABD8F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950470; cv=none; b=ez7E4haS+xI6mtBoxZpKaebDaEJdfpppA9DgT5wD4qo0XKdAjp8sNa0HwkscEjcQL4MP18iwjl9MzOjGsC77rZ3xiHMfTOoD73676kPiWo6tzy9epS0wWBD8AZV7L/Pv+CW9ihe0BSBD9XNKzVkdBVEFXJ/wPmWh/5VtQZaHnB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950470; c=relaxed/simple;
	bh=fhO/IrhYIm8dl0ygwuZulHKhJvaq6wBppghEv+lfuH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ndr3Kr9OfQD+ixtbvJnSSF+KFTYeRrA/fWbxSCaUtqaBv4N2VMs7tKmxusy0XV/oQCfbG7ZQPOAbjQ9xByN6o6iRvOvbKo2MHTmx6X+G3OlREnCrg9sma1cj7dAmgYg36EL8zeuo5/pMm4C2HJA8Vi7o3nHWm/9bzEFnKfHq5Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEtYjKMC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEtYjKMC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4957eefd361so11379415e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787950467; x=1788555267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhO/IrhYIm8dl0ygwuZulHKhJvaq6wBppghEv+lfuH4=;
        b=pEtYjKMCLPRad9lH0p3xVoA0eQrJ9/WPMoNGQ4N0PnQvO7y8IglX7uvhHMyVU0l/qh
         1Sk4ZBdvXuY45MWa2BfY+KTrZ2Jco2ffZIGPzIOb0AgSxip5WJsqwZ2bL5W0ik5cOe9W
         Apr5xOZDXyt3RaEP5rstCcba0AVyB+z7i6yWs5heu/GBeb4kHPt3pqgUymMNiXa0WPJo
         /6r+zrP3zoMQWmQDsFL6SJUwqnu8QaR7HbDuUX580G8aPUDVAUQYH/7kKudbvuKYgYlW
         BBMKddllBIM90VIvmn/fHQEQehOcNq8gWr57A7LMIz4pRDzZaOVrmtv0cd8VdvA8S+60
         mUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950467; x=1788555267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fhO/IrhYIm8dl0ygwuZulHKhJvaq6wBppghEv+lfuH4=;
        b=VTxqIZGYJ4NhJGksGk54dwRSimtyUPg3iWYwmmMcFfamDpGSaOAxh3AkeHD1LRgs5W
         CqSLfZ4P4W9VLoKyrm9DkNBn07zujEMTmW6l8iZ3re9jgC0LRsavweo+tMhx+euNwXeY
         6x3+XoD+c4UTN6CiGCwjsWCpfmqVxODqiYqH9sPQ9d7X2J5nFXlOXpfV7Ifc0+OaJgXR
         gNDTXRgD7F1J+GCRL+aqdPrVJIReJ/xx+/+G4gPkh2gM0AJ0xAsi2qIH4LvfOM5jZKFh
         u/9jJM9nkSUTYDgqaShzJLoZKHgwUi1rnpWhmSEmM5E9mI/AqUdXK/lY4UyW7lrw3QuA
         w6qg==
X-Forwarded-Encrypted: i=1; AHgh+Rq09soBccbAmxOO9uUS95Vyh0C6+o0DS5oCnXTH2jF3Tlpj7zrBPxscQjb3NM83LLfyHP9VRyPlpL3sm8E=@vger.kernel.org
X-Gm-Message-State: AFuF++mxHf58uTxXU0Qf2cHseXLKpZfAwoJjZP7Qgo3dXosURj9RhSYn
	NYi80NClNBWpgepszDnRrJi5WeQ5zB+cxU7YxWOnsgSBcZ+V7ID5GDU=
X-Gm-Gg: AR+sD11gJppUabgD6PwnA0xeXH+SCbcg93O1ZCI7CNx0atkUzmTFdPgKgwfk9ulbtv5
	JZ/YYbzOFWGnQS0EO5JZjp/RfT+Wakzoz0MePFYMge/DzesSo2CcnBPFBAlzP08ykkTRiAM2qM2
	hbrGbVl+kvEh4/ZovH0AfT3sumlGO2ne94lwtnrQR4/AxS1zpmEwTn90AWTW+5zOdtzX75cEinm
	RBpqkquRdoUkDORR3RLfxkT8OjRxzTdXlt9AQ0EifFpeJoDwpNQ81iKZRm7uImEmjClTF8tJr0N
	itaXSRdZUqgYRyHWo8nJpXe9iNMMGtOHXoz5tf+3jk/Ofhx7p6tULxOskZo8tnpn+CnM2Tt2DuW
	MClz6Zt8CyhI0AfQgj4W6oC4zxo5OcEKwvevZvXRqUP15EGMqrnOL91TDxqkXO5jz6N5T59SzoR
	JJ9OBwk9lWqvoGxpfMXQcBCLjgWmsuvDVJ0UmxcJ6rDiGVSzqFpKbBeZSHBvQ5tzsg4okYCgfA0
	oNpVukQJQYP
X-Received: by 2002:a05:600c:8b42:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-49b91c57d64mr155340405e9.15.1787950466515;
        Fri, 28 Aug 2026 13:54:26 -0700 (PDT)
Received: from surface.. ([217.61.227.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm108120835e9.12.2026.08.28.13.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 13:54:26 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "D . Manresa" <dmanresa@gmail.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Date: Fri, 28 Aug 2026 22:54:24 +0200
Message-ID: <20260828205424.154443-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apGqPKMIk5kgqfMj@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com> <apGqPKMIk5kgqfMj@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, Aug 28, 2026 at 06:33:16PM +0300, Sakari Ailus wrote:
> The regulator string length has been increased to 6 since and I believe
> with <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm> (on LMML) the
> camera might work streaming-wise at least. There might be Bayer order
> issues though, there was another patchset
> (<20260729-sp7plus-ov-flips-v2-0-91884b81a8f5@berg.pm>) addressing those.

Thanks for the pointers -- good to know about the string length fix, and
we are aware of Jakob's two series: we have adopted his POWER1 approach
in our local tree and have offered him Tested-by on this hardware to
help both series move.

This report is orthogonal to the sensor bring-up, though: all three
sensors here are fully powered and streaming (the cameras work
end-to-end, hardware ISP included). The issue is that ipu-bridge has no
teardown -- after any unbind of the IPU PCI device its software nodes
stay registered, so a rescan can never re-probe (-EEXIST), and once the
module is gone the node properties dangle into freed module memory. It
reproduces on any ipu-bridge machine regardless of sensor state.

Would a fix be welcome, and if so, which direction do you prefer:
a real teardown on unbind (unregister the node groups, clear the
secondary fwnodes, drop the deliberate struct leak), or making
ipu_bridge_init() idempotent so a rebind reuses the already-registered
nodes? Happy to write and test either on this hardware.

Regards,

D. Manresa
