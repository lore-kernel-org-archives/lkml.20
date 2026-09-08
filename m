Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D27346FA8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840638; cv=none; b=lMRDtApAM5k+MHU0tigNkcFt6qONouhVUFS/FktxPdIirW3U3R4YY2xYtNlMcaYYbb28lqAYu5dur1IVu4pVT7swTtMOPPcW9RbFFpnKnaPASwgLaRgvix0HWdXdmx9OTtv4EhZF8EXXTrLvURwFBDaXAN1/FUJVvNtxdrbAQtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840638; c=relaxed/simple;
	bh=BDT5nxYXMmZn++Gzql5ffym2zj5FsDZfX6gFd7ck4pA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZporIN86V6k9pEp9vQmSIJfjoH/DWbUAUXpyiaNJWANRVuw7qmIRi29+VrZjHd8zs1UOfF66x2aBi0OEOxeYQ5LuS3+P1S2T3q5WZ2M3EKazOgohTlj4nsfK58yS9S7RkmAhbeq0jXQxDdhjDwu5WP5oioGoqrq36KpMDoTIhQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZbEAUhU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZbEAUhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020DD1F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788840637;
	bh=nV0JKeMZMS6STLhK/ANSZRNY6AFJEmTUQYldyO5ECpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NZbEAUhUSzOCcvo0459HnYoKMDlGkn3ndjXZFj7dXeacX0DkW8EuJIRyFgkuOQWDB
	 Ald25uGtpxF7CZmSAtKP95N9lZ+p3Ev9CVQcEoPCrkWHKbwz1c3ChjxLSge2hlHVht
	 heFuSjaVXLzgUzsbry1Zhv9ZOcJpjRAQHdT1DUt+VR5cPTLq2apcNEuWZxQqOcPl0B
	 GY3dYwUHA2EIn5VRpMnwAHLaP8JG0rT23Ki6pMjrTTVyq/dfJZOV/Pqx597j7icXRZ
	 U6eb+kzGVWfhxVM1Pw1fGLrL8TEVc7alHyajYORaQr0wqKsfMj98IIvTnRRokAf7dr
	 9lOrWlTLb3Leg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2544ff970dso574594966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:10:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTppo9eb8fl/R+6cUycWKECtgvDtQf1/4oM1/zmF8ovQYeV6w/O7qZekIqoAdyJq6rn/ts9quL6v/jxYc=@vger.kernel.org
X-Gm-Message-State: AFuF++lZHTnOCYt3YzMo3o5hLkYw+Y8c85U8XnXRu59+hWzKPs/jMR+a
	wjQSP2edLuP1zMUeaKWAPYHL0J6JtevKjWPh2THVq8CN+YX4NY1YZpAkLc6QLuFKPPtaLDcbe38
	8s7JAP8DmXvQNwDqNEGv21vif1PkIu0s=
X-Received: by 2002:a17:906:6a1d:b0:c26:1649:47b5 with SMTP id
 a640c23a62f3a-c2616495671mr949630566b.43.1788840635644; Mon, 07 Sep 2026
 21:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907070852.291323-1-zenghongling@kylinos.cn> <20260907070852.291323-3-zenghongling@kylinos.cn>
In-Reply-To: <20260907070852.291323-3-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 8 Sep 2026 13:10:23 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Hs1aEe_Tx4QwaKVUWM9RSrkAcO9Q7naMQWxg_2G0vAg@mail.gmail.com>
X-Gm-Features: AcwNN1VNTCtn8WAo4XDE0Z3ah-hgIbS3QYG2qzLu1C4ItDdYGmQPmTpEjM8yrWo
Message-ID: <CAKYAXd9Hs1aEe_Tx4QwaKVUWM9RSrkAcO9Q7naMQWxg_2G0vAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ntfs: sync the volume dirty bit with the recorded
 error state
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -1621,6 +1666,11 @@ static bool load_system_files(struct ntfs_volume *vol)
>                         ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
>                 }
>                 NVolSetErrors(vol);
> +               /*
> +                * Remember it for the lifetime of the mount: see
> +                * ntfs_sync_volume_dirty_state().
> +                */
> +               NVolSetHibernated(vol);
Could you explain why NVolSetHibernated(vol) is called for non-zero
return from check_windows_hibernation_status() ?
