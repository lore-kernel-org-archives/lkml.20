Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FEF3537F5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788623573; cv=pass; b=RjodgAe9xk9MI8vPj9G6jB6L2LZpBylkvGMV4EKmsUy+E6o6oG/WkkQf5hF+ZV1GSuahWs/FojLjcVekHtpkOzOe+ucGu/IuFpY55U6iOJfG+ZoEsEe+3eib1BCiMfh2WPcnASNA1V79XB2u0Jo+jokHREa0pwHuhtG1wMwW2ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788623573; c=relaxed/simple;
	bh=Kv0M8qyBz8AiZgOwtl2kafCJPZCOeq5ea1CJHXP95kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fy4aiAUqnOvokKkhLhPsdS4q9uvesXnH1FEgfY/UPwSGzcNTJHfXJqcZQ3CYoeh+5ufnCGh/ADhl5NnS2MVfYPdA6lx7qoifQZMHVWVgJYc9GcyF6zSX6aA90BEDtPYIekG28A54I6/BlVKMR7N0m78CZGPDCUI8vhYxjTeFiyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwCWJ/Wk; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwCWJ/Wk"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so2608730e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788623570; cv=none;
        d=google.com; s=arc-20260327;
        b=E2YE5bspieJtJJVsVo2YIkpoiF9AVx+PtnfKMSIdqqPuIGDHea1cHgJhQ2U7m95Nvb
         MZc90iUE5+68f/TUnSAe7nLRwdVdN63aS8iV75xBgAcqOVAepVj2U//lh41Mh85fJscA
         ZWqhw4Dtx5z8J5ZzPrhUkJyGBOxsHp5OCEzggcq99przqqAN5bJkilBdNVXimubHOAHf
         Ann4szMvsmLKSwL05jDhGlBXBLZSOGedF4kZhZ9R1JESUHTSQbB1sop9rbDKT6GjDF1w
         1eLXL3b1VaF1AizDabzs+7fmZdNG8b44i4TRI9uY5mIbslUQ0XSI3/a2hYQ6nE9w53AY
         4D4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kv0M8qyBz8AiZgOwtl2kafCJPZCOeq5ea1CJHXP95kY=;
        fh=79Xs8vWqPB4Z1rOFbhTjGZSuvNXU29zqw9LttJXyFMc=;
        b=s7DavWZqbosyM9VT/Ja9IhXOCh22rYSIBfmI1/WtgpJc9cwqOnRWziw/UAQvoXL+/P
         AaetbHuC1gNXOh62mqTm34J1XceHffZbPrhYX77uLK7792y3NeTgcCDMYtEapVF0R6l2
         qzM7Fn48BG32sZzrvRUbdq4z4SFt7zSWE1etUL4ME+nT6UYXLQPfW3/SIywPoxMjFi+x
         fhu751t7vrW47wTdZeRjrHdRtMbOomUh7/QNZ5XoZ2FNwnV5PGf+Z3z86WyhLEyCv1yd
         d0brt58Z583XT7wEWRtnZfrPAD8/1pbCjZ2ssHyA0rrlJ6c7xbYJ2XxcyTatuehCmKah
         UGpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788623570; x=1789228370; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kv0M8qyBz8AiZgOwtl2kafCJPZCOeq5ea1CJHXP95kY=;
        b=ZwCWJ/Wkmk54JCJsv+brbbazhG2lzR69i2e645S6SoVdDNQ7EJYfbpc72aTvCqxxQv
         SKoNK+p2qhFs9ZHuBFugLLyiB+4j9ZIyPvkr85DQeqNOQWQqzt2Er1hMLZ1SPxIqYEiQ
         qT7n9PuG93YP0KrJQQaeU8GP7A4UKjkmyuULId+bCqh79K1vx9rKd8o4mGD3IbN7BSpk
         zBJpVWopXSG3+tAkl92gWrkkpeaXENzaZrAMUqefdSdquRO6pWfHDB0GpyMAPCI7ZkWW
         46RgmKesMedhqyD1Y7z2TQEzEOnyqQpGN9zeoxyoodbdWQoOIRYYkbmBthga1Ny5UrZX
         lyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788623570; x=1789228370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv0M8qyBz8AiZgOwtl2kafCJPZCOeq5ea1CJHXP95kY=;
        b=Ef8MGa2bY/qpBjhZelcMhEEtVEnb3y3cZAWjZTnGhn+/luqP+SNv96Fbsz/UfPhsrf
         OBa6fTAahjrbzIQ1RbybpBIzlgLNHUCW2ZIr85Oc0kIZiVzKE1iB/sk8HbdXKwFJsQkX
         9AuKp5LKlDdU7TxbV17zrXF1UO7VKIBhmSJkrmLID1AQE5Lj/mYng3BW6pqLFbwzjYxQ
         2MkHvtti0JgzQYKGU+G3pdH42o3n5mmQN/XqKgtJnYFGC7U2GHEATOR97XcE6SCkkE1S
         SuVY9vSYhdeJQccM0Bpuy1bYdT+HQ8FXIDCNCYMHkJymTlqSAv2izB7L4ItkrNA1xqhS
         YvEw==
X-Forwarded-Encrypted: i=1; AKwUvBxR+yQ40Py7PGkpPsS6ZNunAUtwRTQ6e8X+ZWfsi/Kij2MmK/jSQGBBCAGXypWxO35ib21pNuAaDYjabjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kPyxyULNot+pUoHk0BwOjqeIoQv7qQe8IPKaWH9W57VawFfHHp
	cDkoO83hxueayhWvPAhlGKCT6iQvEtcPZ3nZxq7N/bTRTx/RdIKynkvQ7QaD3vsDNuxHhKrP6WY
	zRl/YgP2Ji+fLg/0IbXKbf7wRXqcaLNQ=
X-Gm-Gg: AYBFou2rLoEJJzaU07T9Vpja9I2hjL15uyhkYAbhIpnFcGjxM8oyfsvZ+N1IT5lSzJB
	HfopFwGBMhHBJZlmYRTCb/GN+aU+XzB8e3G1g3ygrKf+2Qq9/Gv4zexKR/3eepijwBt1Hq5qm5G
	Xso/+dGB+0jeHyHKfJk13Uo6ZSTLqqZ5MLriXmKLVB79layfNC1yry04FA+ntEKl3Xky0FTE+J+
	MAKfzJ0wjYbx6gTzVbE1raesdHfRnGAFeqGdEy7/8VFbORoEBlxB5gXBN6Q+wgqBqTwrHD7Au5S
	60LsWvMPYSuScNQep/yF6IGBNCi/bOVosLlPrljU5IkE/6dekQI8oBQZq2hfFoTE3ZlsN2AlhQo
	tUSZAxHNoKnnKBIsyjju0d0pXPsA=
X-Received: by 2002:a05:6512:10c6:b0:5b3:12b1:be93 with SMTP id
 2adb3069b0e04-5b6170dee63mr1554897e87.0.1788623570165; Sat, 05 Sep 2026
 08:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788298883.git.ahmadexp@gmail.com> <89780f7db207c7fe7adbd45e1f38f0a041794c8f.1788298883.git.ahmadexp@gmail.com>
 <apnRfWVAiXj1fRXs@ashevche-desk.local> <apusvKc2PnSShaoI@gryt> <apvJaBo4Zzz2GAMx@ashevche-desk.local>
In-Reply-To: <apvJaBo4Zzz2GAMx@ashevche-desk.local>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Sat, 5 Sep 2026 08:52:38 -0700
X-Gm-Features: AcwNN1Uulc5j99vd1g8KKcjM_9c1_I_u87n5sCZVaRosxcsgyccAcFuaDvKiJZQ
Message-ID: <CAOQiBWPf1qPcVqFGyw_L2zn46+Nkp8WZpkodM3sC1hpFgYnEHw@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] i2c: mux: Factor out channel node lookup
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Peter Rosin <peda@lysator.liu.se>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Peter, Andy,

Thanks for clarifying. I'll use one declaration per line for dev_node,
mux_node, and child in both patches in the next revision.

Regards,
Ahmad
