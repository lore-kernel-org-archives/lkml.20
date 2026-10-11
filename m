Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884104457AC
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791721539; cv=none; b=FgQ3x59VE/7lr4G2ahlGuyMj+dPmq6GXn25RaPMf0nM8MGnytQit/mt+L2JTvcb2JI549lGl5eo+xZWOv3VoU4zEvRcNxSp57bq8Ej7aMvdJgkPHA/wGXY3dmxmwSGts1qEoySZmHpLx2V6jrPnzB17nLQo02wMf1kUE8xp9Oic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791721539; c=relaxed/simple;
	bh=FQ2rBZUvBc+xvTFLhTR0QvwYODc+fEnfrI/KibvveLk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YDoMSlii2pcX9ID+nixD/TeI2/yY77bR8Awk1D4MIo0kujncdsJ8ze42zGk3whWO7dmC8uqUl/RuvVcuRVSUIdEKwgD25Ms+F0siKqm4leV6eL3vYDmHj5Jh7zGn5qq/vqp5EZ1jc//1ZDU+I2lcbzshU7HlEWm9Ch+O7ClX3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRVlA/Mu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRVlA/Mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D241F0089B;
	Sun, 11 Oct 2026 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791721536;
	bh=irOGxmKVDrEZKvZjgOaKPJglMLW7T/ynGH3oeMhA5Dc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=HRVlA/MuFOOBYYxt+yvZc7WrB9DTZooIq0n+/qthPKkL1OrO5egtQcqKfRd8EHCeJ
	 VT0J6rNLR8zvWXZnC4mbqiYIQbja9qeC0x6MPJ/IlwFXGgfrzSXSGlkDi0UgYfjwkF
	 mvh39De4NklF0SJCfBA8b1h6HdMDrQzbQL4w1IMAxXrSa0MzJTlrIrzioFa4x+8FpO
	 6WaIsZq4MVabg8dD64/6OZXfnnzPhEo5jiqzPnpH7sqhxJXNHWzE+wMjlD5mt2ff5h
	 bq0BkvsaUfgq8E+oIbPwLVTqEFWhKqaiJoKxq8TCNhM/t60X3DgB/jznU9rV/jbY2P
	 Feh7NV0CDbVaA==
Message-ID: <8cbb8aee-189f-4c69-927c-7deb1a50ab8f@kernel.org>
Date: Sun, 11 Oct 2026 20:25:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: bound the SIT/NAT bitmaps by the checkpoint pack
To: Kaixuan Li <kaixuanli0131@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260919130925.1899994-1-kaixuanli0131@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260919130925.1899994-1-kaixuanli0131@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/26 21:09, Kaixuan Li wrote:
> sit_ver_bitmap_bytesize and nat_ver_bitmap_bytesize are used as memcpy
> lengths into and out of sbi->ckpt, which is sized from cp_payload alone,
> and nothing compares either length against that allocation.
> 
> sanity_check_ckpt() has checked these two fields since c77ec61ca0a4, which
> added them after a crafted image overran build_sit_info(). That check ties
> each length to a segment count; it never compares either against the
> allocation, which is the half this adds.
> 
> Mounting over-reads in build_sit_info() and build_node_manager(), and the
> first checkpoint writes the same lengths back through the same pointers,
> so the over-read's contents reach the on-disk checkpoint. An unmount is
> enough; the filesystem does not have to be used.
> 
> Bound both ends the way __bitmap_ptr() lays them out. The three branches
> differ, so a single sum of the two lengths would still admit a small
> overflow when cp_payload is non-zero.
> 

Cc: stable@kernel.org

> Fixes: c77ec61ca0a4 ("f2fs: fix to do sanity check with {sit,nat}_ver_bitmap_bytesize")

The overflow issue exists before this commit?

Thanks,
