Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750960;
	b=qRjkCGc90P9j5N0OqvelbSdVV4kAzKsFVXp6W3RBfl4fhxk8SVtlXsbakyynvmzV3ZWX
	 gN+5axzWMfhyvkbAV5KBZfXA9b9MzqE5PQhKus1EOMeQeJteg3tN0lh+5pF/5Id5288RC
	 kFIlFTIpvc0RrXwuYf5K26fjWTm5rHpSmQD1PJmOXjWYJSrgSTMVeoFVqZelLlahkC2UD
	 pjU0N3TeO0LG5x3xxtjvWqyd1aCR++Bn2h1cWYvgQ4tHvoHNgmMalxVdSVRTSz5P/pvJ/
	 S7BJzByfsKkJw6FjRgGlkdvEuyr/xBNI+ntllGEAEpZ2EJf3T0b7ZXsRs5FmSVAz7BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750960;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hAp1f5HJymx1C1eLBNtpgn3RwhEpebpPxR/1OejtNF0=;
	b=Q6GrQv8uPgpR/O6TDNNyy1sWm2Wl4/xdFakfzrpRfoYe/EqRLn791hD0ecKQwVsb/mvC
	 Lr+lMEIM427GMKiBkcYwdCVcF7VlskIJguxOBwjwrPwDsNyW/E9pz06qI71eRUIPXtJtc
	 IG8W3PeGnLQ9UEvVTstYM3GJO2IzcVRSBtl8/tzpbz7NG8VHddjyJQ5ahKfn3rsdg29g6
	 XT+5NH97hAIR4mDyzeYcY0Ap+x6ctwSHXd3SJ4a+nGotNVm9UWYoCRxubsmrUT1e1Jamo
	 nScW3SupxtjR5qufHKqk1jpkDy90OVM3eGwNojWvr0TKvg8iav1RyW01h8Bn2qLcAUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsVqAIWj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53B606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsVqAIWj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6C11F000C4
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794750960;
	bh=hAp1f5HJymx1C1eLBNtpgn3RwhEpebpPxR/1OejtNF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XsVqAIWjC4lXMDgMwr/kFUj5/a6++KNyH7YKRVm0ZEkKu1Zh3omRmhWW5xyLZS6L7
	 zlPvJVzf0aEwvM1FREYrv7XutE7sCtUg5jEjD7PoO2Jh2QehaPebInvjUTlNMDm/Q+
	 8xDubh84hs/1iNiQWFAheh4CoIZvkJBmfMP056Y0s09xMOceLaO2hHCsbQ8u8CVfiw
	 wXILBB3jwSRHBQqQejKF1y8t1o9VmJlpgztn2hV/TBX7IYtjt5wg2Ml4aG/HCjzrY1
	 xh2MxG6pzN0NBtU9FXeOMNTt0aHYvn3ej6qwcVwzmjv3Va8c2UdJs6dQx8PR/MS/lu
	 Y/ARWUHh4tbFQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5080ef9b31so466711966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:56:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFur8ofJ9flRnKkwEHfu8y4xGvrN/1XWJ4yARhuSjNl4CrwQUxLzh5z3cDceWi83VTCUX+ss64Lbu5aYG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UtrU6dMrvKmpnunRQM19M4K7teue4nYK2R6Xp1FoCIL3y6fjG
	XbWr16lgb/8x6L7/wLW+LyqkfldZIsqrJnWuOgv2tZT1vG+vJQqvsLmSHhABiwU1YGrc2YyvY1O
	vlfY6326JKN3PM72yodBunMIcHAPEjeA=
X-Received: by 2002:a17:907:944e:b0:c29:22cf:b0f5 with SMTP id
 a640c23a62f3a-c509634ac8cmr630049366b.33.1794750958896; Sun, 15 Nov 2026
 05:55:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112134041.4133634-1-liubaolin12138@163.com>
In-Reply-To: <20261112134041.4133634-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 15 Nov 2026 22:55:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Zg6Qy8vyu1tOXLn387R-1KOVWnuv+Z+y6=_E4so23ig@mail.gmail.com>
X-Gm-Features: AclHuK-NDR_thR0DehYI3BeOo38-z7P-1doiJEQQKyLyO4Pxr6t_QdkIQXbmVn0
Message-ID: <CAKYAXd-Zg6Qy8vyu1tOXLn387R-1KOVWnuv+Z+y6=_E4so23ig@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: add Baolin Liu as an NTFS reviewer
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 10:41=E2=80=AFPM Baolin Liu <liubaolin12138@163.com=
> wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Following Namjae's invitation, add myself as an NTFS reviewer to help
> with patch review.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
