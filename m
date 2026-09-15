Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889FD3BFE3F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488096; cv=none; b=sxk28dhlWYnMNDF0JzIIeblrvYZtJjl9NlYnmg/mDZ7YnnqkeDvj5rYs6JLpTjqGY1AyDWKxnYcF9UCFWXFbDvw3NUpC+OODIWMznz3sjqgle0kQ/+OmJbRw1HuV/BSHD0vI7rGxqZAS5QFkwkOtADj6OEjYwGdh+6KxuQH+edQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488096; c=relaxed/simple;
	bh=l1wdurB+pidV4AILXrT+tLTz7zo3y2Q6OKy1w1aG1kQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0v5JTAsEmmD0PQI9/8+V+bDOe5oUXc5WIsxc9ZJ0ohA+DboBlRYI3arRHX1iA2YWyK5ylfX42SC6gBdzrBmsQ5BcnO3YXqIUZQs3fiFaOVPCe+9EZfSgjSQqeYSYDZjTrTJna1DC1PELCCI4ff1DW2KTVmQV8pBgwKB5Cuxxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdu+kAFk; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdu+kAFk"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e8ef5b507so651499241.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789488093; x=1790092893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s20q7T542NAQUDk9biMPbZxXmVhh38LLJCMfX8DFltU=;
        b=hdu+kAFk17kuJfjDPLx2/MBTd28lL+xe7nxB82TLgOJIzSQQ9PflXqtUhltCEi7rv9
         IpNh+SuqiOwipQMoH8pHplDpAa5y59vFqX/bc3pic9FA1EQXrjM6KgPsgz6U981Gh/7M
         VC8dqehDfynG9TzXpozl5euKgsgNnN4mqQ/8cgn8NVgLw8iehJVq2o+z2rV1yfDkSCfO
         aUK3lpL8PVnF6CxZ7XJLnR7f9nmtR+kUn9BeGosQa+HzpGAbXDIsIraJWIn0VKACfMAQ
         8/JvVgBZc7wm6eEUmeM6GluMW4NJfuu7yVfsWBzdo8LUtegPtlLFlxeOesPdlRc4thGb
         E0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488093; x=1790092893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s20q7T542NAQUDk9biMPbZxXmVhh38LLJCMfX8DFltU=;
        b=Nvj7r9hgCafsrY+XikQ5YJDF+k3TNhCoPEaxIS7QFxKZYofiN/be2TGWviqzdKxAhD
         oL3++UJ/DPbYitZo6VzZluunBPaseDT3g4Olfy+5GA7XwmrJSqZUSvx5LCzjY+mgBQnB
         z8iCRjfU39hBA5QlS2UuyNfGOsfAZLz383xmNW3oT9jQ8gBJ/X1A8fx9QSfMzBeATaJI
         N/D0O2GuO22yOJHQ6xIFsX4D8H+0MJ0PX70FNLEkHUiOoquEbArVsMFjz8CZKAWi8mhR
         OiXen5XEuFkHfss4QM6Aa+fro9JeJk+DyDvfVCC3tWF/Ezy3b749qHRDyNGRR7YefH3J
         RVow==
X-Forwarded-Encrypted: i=1; AKwUvByJlucX4tEIh2UMSeKe5OiL0jgzdiAgV2n6DdbB6GvnTOZzCUhrTsnr68Pal6/DrhR4VP97LbbqecTQLXk=@vger.kernel.org
X-Gm-Message-State: AFuF++nMreZZAcChQvpAHimQUXtMmdxlsLEv4Lu3tP3pqMm++vv4M7CE
	Hp9N+fQaP97ZsLgyl9HuUYa42CzoMHBE0pH35RnAea38G7+mewdL9dAe
X-Gm-Gg: AYBFou1Xy2yPaVB6nysEs5VVU6oUyANpnx4Cs6FmY8vxGPaAS27o+R1AGUP1dQAPVxH
	q+de6sK007YiCygUuCYJOXYDH3EFpN0GgSCrpwfQ5P7r2GfuMvoCjZOgc/xzZx2kRR1CV7Pr89W
	HtuBkJQsTwydCIDM9Lf6LUEcJlI1nH46qkCaU3x1Yn9V2FiX4oeaylxunMwxlU0M4NvgRU+PM/3
	5cbtngKDPzaoJ4oz2gCoYodf8YdgAmGHrBZAvdBpA8lMFAgM08MzAlf/1IhWU1HNfao9eDinJjo
	xZRbWSzbf3DzkLIvEUOh3DtLAh701ZRNPJIV8cJzIOwfygz0qKDXSUe+luPZBdWBf1yZQuZQJAk
	1FbHKJJKCcKb8F85nEaeqbewv+8oy2VdAddjN+nxezbA6Y4+dd+0oRZ/aEk7mqSo+Vcc1wI3Nk9
	6qpdYndxOoiIUpxwE0SOd0f2WCjtIqIOLoybr7HAVsZ6HLTKYdxI8rFY0H1wd2SiNF
X-Received: by 2002:a05:6102:5f0c:b0:779:328:8a2e with SMTP id ada2fe7eead31-79d24d179bfmr613801137.5.1789488091386;
        Tue, 15 Sep 2026 09:01:31 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79facab39basm114393137.2.2026.09.15.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:01:31 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfsd: clear XDR padding in GETXATTR replies
Date: Tue, 15 Sep 2026 13:01:19 -0300
Message-ID: <20260915160119.3105745-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfsd4_vbuf_to_stream() uses a raw memcpy() for the first fragment of an
attribute value. xdr_reserve_space() aligns the reservation but does not
initialize the extra bytes. If the complete value fits in that fragment,
the loop that clears padding for the final fragment is never entered.

A remote client reading an attribute whose length is not a multiple of
four can therefore receive one to three stale bytes from the response
page.

Encode the first fragment with xdr_encode_opaque_fixed(), matching the
final-fragment path and ensuring that any XDR padding is zeroed.

Fixes: 23e50fe3a5e6 ("nfsd: implement the xattr functions and en/decode logic")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/nfsd/nfs4xdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index e17488a911..51ab68ffdf 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -5953,7 +5953,7 @@ nfsd4_vbuf_to_stream(struct xdr_stream *xdr, char *buf, u32 buflen)
 	if (!p)
 		return nfserr_resource;
 
-	memcpy(p, buf, cplen);
+	xdr_encode_opaque_fixed(p, buf, cplen);
 	buf += cplen;
 	buflen -= cplen;
 
-- 
2.43.0

