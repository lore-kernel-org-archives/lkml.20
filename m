Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909821;
	b=y4zLBX7zxN3Ose24g6z4lR10M+RTsFxCKsMeX6umqoyUgt7mFBoB89eHKoOXMy+YjsBj
	 y+IXdOkbOToi/PQC8by68Y+wD19/y5e4ILEqiqONPokqN1xBLaDeZswd36mf5FkJmkqEv
	 9ffeuPdqr7oE4anP7zJcXMKUUAG701tkuyUYYuO+V7JyBF/UbbEg34ohRpne8I73lwuM7
	 dpmxf+S02b1DHhh+UmgNqgkg928WIkf+Iwj2iw2yZcPC2AgdD4VSKQrs0HwTNu3J1aSfn
	 BMzyuS6T0GPzKrshmd0U8fATBDhy0EwPx1m3qrN7BscbGdLks+RMJKh75+GvqLsfVLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909821;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G4SJkbbryGX39GBfapc5j9+NJLpHzq2qrYadOREFzZ0=;
	b=YQuRHwXzi83iZaYphJqAU4gFDTir2hYHnjo8Iz+snhyWaD2zOtcA8iM+wNMEjsZqcr/a
	 ri6FzGHZIdJVEZCexx2xStTQSTsZvWAgBculRFNGtWV2/iUhIWZxNQIZWoY8tlvR9lx54
	 uO6UCGZMedleVmCvDwPGug4BPjhCLjy9H6QRKyp2u+DG0EG5I+85k3TTMwbvisBhbkuRn
	 2uxI41W0tYDH2b2cKtT7XTMUzLc7T/S5BzPSjguWXm6qyMBnzP3G8Sm1IMhcBw5XoFhjl
	 Yx1XhTZGyKmBvDY1OkxGe1dSn0UTnpxmOSTLnDlCNi4wDXQb4WEqnTd7vmNgaQvhHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoixdnlM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoixdnlM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD73C1F000C8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909821;
	bh=G4SJkbbryGX39GBfapc5j9+NJLpHzq2qrYadOREFzZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FoixdnlM0ZDr7xmOe8IbRBHfnx4iTwawdza9bJR+U7S5uVnvt6/H4spWS3kMqQKGi
	 NfyTg4rxZayvCMUtsApRYHL2po5n8/eFKG/1Rtlh2105YgNEs43lGupcgSejLltmUj
	 r4z1caK75fCmr/z/52UDA2+FDgutzbCu3IkVtWIn5uczA0oDARLlDvD+rK/ZjjIyGj
	 k0cKzE42AY9wHL/p3taekgVhjyX30pXm5UYH0Rk4OL+YNt3VJyBhZHDLBlhSWJpR61
	 ILVZhLYlGQfqYkp3hisULgVRJnP5iIp3Afl4kNuFnrDJ5UPbEfxjz2dNLkmHsCzX8b
	 qVCq3hSYeK0mw==
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso3968676e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:03:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEUiWmAsBi2ySMijd2fFDR6fO8+v4PWUoWxQ9OY5q7yOhMc8KfCsINH+qMG4jECnlzaXM7SKINnfmmSdeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aocgpOsvjvYHW4+fAjiIfHsrLwnxnYZGVylUqr8uvP2O2hsTt
	nC/JTP5nyXyLsTbQkqZp2HdUVEI/DluDBzaDw+H25nt388XxB5TvAzKiqgSiU0tCCC/ty/M9D/H
	W6tTlQndP+TEqN7nhQCpdrQg8u2aAGAY=
X-Received: by 2002:a05:6122:3382:b0:5e9:176f:a548 with SMTP id
 71dfb90a1353d-5ee344ee205mr5276040e0c.0.1794909821090; Tue, 17 Nov 2026
 02:03:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com> <20261117-unused-sym-mm-v2-3-2f845e94dd50@amd.com>
In-Reply-To: <20261117-unused-sym-mm-v2-3-2f845e94dd50@amd.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 17 Nov 2026 18:03:29 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xpXzdWxp_B2kNXZmKCfE_PcgTr5adkLG==jEZ7+y+ZDg@mail.gmail.com>
X-Gm-Features: Aa3M54oSKLyjB7hd6iK-xbU9SbU3gd8PIMBq2jzZeTHI_Fj_ONDhoTV0tNIHTEY
Message-ID: <CAGsJ_4xpXzdWxp_B2kNXZmKCfE_PcgTr5adkLG==jEZ7+y+ZDg@mail.gmail.com>
Subject: Re: [PATCH mm-new v2 3/5] mm/swap: remove unused folio_to_swp_tb()
To: Shivank Garg <shivankg@amd.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:17=E2=80=AFPM Shivank Garg <shivankg@amd.com> wro=
te:
>
> Its last users were removed in commit 0d6af9bcf383 ("mm, swap: use the
> swap table to track the swap count").
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
