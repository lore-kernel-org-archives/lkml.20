Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4620048424E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781519; cv=none; b=IAaTMwwb7L8YaNvT9twvPFRmYc6bwWdP5RFGu36wH5bpasrRChJ4NlKgzTvc83VAdNwyzQCZc+th0mLOqwaipMple/8T7/WGC/8Zakd6N3F50HbHwKkzHn16QafDJsdB/DDISaFENAyxD/YzeSvwoZ3IwYBEZDV8OkApEFNj7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781519; c=relaxed/simple;
	bh=qU1IpMT8bK3pPXY9a0AmvrxHeukg5g4+jJl2JXotTZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZ0aIP8KQdOl77h1XHnHo8ejM62+Ce57RHeeBtoXKPcvZoMP924KBdnCR+UwV+aZnE4NA3CxhCueK8LRoW2P+aKJekA2Sb30xtVr6h6nxJHS7zTAUlWzVD1i57axomANDaQK+MXTdYs3LTXPcEydKhmugL33N94r6wMneRCipXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrzd4HK2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrzd4HK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76691F00A3D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788781517;
	bh=9sDiN5W202wwaJRHrN5WnrTcpXIpJZjrP6r8ivLQR10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nrzd4HK299cWLejk5sAM+9PfF8fHxXdu48skKK1FkoMVC+pIzlFHvKx8Lu+vBdMHY
	 e0OCTT+KRLtjJ0s9a5gc+q45XraobPK/jvzea+WqTBvmFI4HhspqhmePuIvcqjsgg3
	 LrqSrr0+wLvekoNLkrlvuX9Et8K4SP4egqCNOMMiDgP3sHSdSSaHY5cC7COUpMX+Og
	 3cvwgk18clu1+1fMkrfMfzQbOT9PC4PZjXmkKV1I93A0Y5IvNZwzG/DDRX4tUYOdpk
	 hpCeZKEkYi9qu2dnLBrk6IqdaMKH89Yg8/7cejxukX68jhp2bbZ84GqjqreyqFKtx+
	 DwR3qnPQRk7Ew==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso541003866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuBAt5qKXWlUMDH6DHeDQLxGEPZMJ85uvJZhQTpwlS9bMVBy4Yerb2DLb/Gf+Ot9U3w2S3qgojwSgMVuA=@vger.kernel.org
X-Gm-Message-State: AFuF++njFa20OvYETXtcIzbUyR/okpWuFjTlZQndhqdYpUGJ3rvXTChu
	QUxNuWunrLDNXPBTfNEFt5/tJw0McY6llpbGLGzr+9QCzWzKWPeVuW7LhrCc+H1V09rda65Ukxt
	eP/gPCfUm2jDeybhElbCEN7pus6fTquo=
X-Received: by 2002:a17:906:c154:b0:c25:378c:6262 with SMTP id
 a640c23a62f3a-c260ca388f9mr791378966b.22.1788781516527; Mon, 07 Sep 2026
 04:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907030044.3649349-1-liubaolin12138@163.com>
In-Reply-To: <20260907030044.3649349-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 7 Sep 2026 20:45:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_qWwqpmVbGTh3C_s-86fvp4WPTd=scV=2cUGGMHRRLMQ@mail.gmail.com>
X-Gm-Features: AcwNN1V7meICbfScTUzOX3D_-ocshbyHeVuTpqKDZOE8-31rHDwIx8IYjWkQeiI
Message-ID: <CAKYAXd_qWwqpmVbGTh3C_s-86fvp4WPTd=scV=2cUGGMHRRLMQ@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: fix error handling in ntfs_extent_inode_open and
 propagate errors
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:01=E2=80=AFPM Baolin Liu <liubaolin12138@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_extent_inode_open() has two issues:
>
> 1. When map_mft_record() fails or a stale extent reference is found,
>    it returns the non-NULL 'ni' pointer instead of an error, causing
>    the caller to treat the failure as success.
>
> 2. For allocation failures, it returns NULL, losing information about
>    what actually went wrong (-ENOMEM).
>
> Fix both by converting the function to return ERR_PTR() on error, and
> update the single caller (ntfs_inode_attach_all_extents) to check with
> IS_ERR() and propagate the actual error code with PTR_ERR().
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
