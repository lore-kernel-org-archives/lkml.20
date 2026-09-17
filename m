Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D11E4A7CB4;
	Thu, 17 Sep 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636800; cv=none; b=OFCxsAecQ7VhYxvkVvnV9PnO/d5ymBIgNvgalmTM7JAX0YruwT4FFCiwrD6gMkcZCgM+4dGbGVkhR7RVAK4DExhWOhj48OCduiRiISADgdyx0gLlXivafV1CaBaKBOzhvgIIKVlR+Vov1NLkNPEvowag4dUi4a7WsgdgCEMVfjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636800; c=relaxed/simple;
	bh=ZQ/929b3BXM+aG41rDbwxkr0pM14Qh4yVfTaS4XVUAI=;
	h=In-Reply-To:References:From:To:Cc:Subject:Mime-Version:
	 Content-Type:Date:Message-ID; b=E2vWXT/UBB15Hpv4Kbkftux6EeOzaZBfqEki+VUdc3emP6huSmiFcEU51WN3eRkZ/6dgYDp74uNTaZ1udtJ+ad6O5faPi5DRhzf23rgYnYe+h4ZPin3grsvQUv4asQdPFyQ6IRWhUAZ9Df+cdGxHUbGabnOI1FOs1oA7tYhrqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DicIUklx; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DicIUklx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789636787; bh=ZQ/929b3BXM+aG41rDbwxkr0pM14Qh4yVfTaS4XVUAI=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date;
	b=DicIUklx3OEf3RMhVXzxD+5fVdmprJWSpoD/ylRR0FBpIOQtsGrEmoq4KIX073OLv
	 j4/favWUhiTPM9/5to23LFma/YrFvlLGcI+iR1g18YokapYdt53NEYQRXhUHpHpHWn
	 HwDg0FuAIw1ZvSPqwMTaV2iGtcrli1ClozJ3h7ro=
X-QQ-FEAT: oHWrrGTW1dCGJEu1CuC8+nIWkvSYK6n9
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: M/7aYRxQgGxsZXeCbMYAWUelb60lOYUJYvqx6936emieKnrpY9QRsNjdmf+/sq
	 rNtkLhPANqaHq0sgZKb/WmpLko42XKqhQQeoIrKF3bYLHXOSJHJH5ytAIw/w+p9k762jdTPbFwfuU
	 yB77Ipwn0NvigQk8eEyVd50nwoCOnf/dfdSjYZaSo9w2+7hMiAxaUAUNSU+bWpoUbOs4HvE4H6Nob
	 EEs2kasCn8xXtUpF4eEhmWFhuiStgrzXLY+elartIU/aHLApOH7TLNLZUYATyZDpxtsW/6fkVdOi9
	 ut4EfnGr1J0Lgg64K/PP0mxnUI15muDDS5u0FVwlLtk0gEoZD81oLIRG2NST4bBnB3ll7nOvW43zW
	 hUncG/wMumbUirJ7Hs6ZsG1TCL13WAmWRXVUx6imr2i3nZacyNxx5pocrGIIxz927CafI7KO7GcFE
	 /xzCY+ic/RiNNGX3L9tf+T8Us4xWGY7SJjKm5oRKj9/tmPc6fsZ4ZBxzc1qnd2F7vSYIxv1FRQAoJ
	 ZcK0zdlspcIgB2qf34XvoZWIE/mQXLOeSx1Yah6tyO20r1FnqGkW6rSAqUJ9WIhL4zVpKr9dB4pWB
	 WEuliBpZEuil1A5shW/wyBoxMS4tBAGcL6NqbOteZBFa3dGgicTAkvYtI1Jzf9s+v+guZYYa4xhfP
	 0vxhbZPDqpt4v4zoMZmndmAT+qeh6mqEvHH36rmSPHsFxmDUDFK/umkBGGlqEx27q5mPALBYhrTZW
	 W7D5mh5nnAjutznNUfbOAZR0CBCEHjJO40ZcjNi7jsjrmngPP1rt5eTk1/RJtaToZ6EqfwNBCGyn+
	 Jv+hPlYMbcyVZum5Riv869QexeivzkGtLiV9DipfGyPJCdEZJonnBXGilleScBcyHPdbL39ZdmN+2
	 pu2vxqmYltymNmj57Rqpeyp/Cjd4m+YTgKHDeDg+4ORVMoX32cHt2cJDUVQMn4seFJPodfB5u4mbP
	 WsEWUm8eDvBk9P/DqwT5yHd1lAIUfTT0+ZDiMq9/+N7BdkdMiw4/8LydETy0/3535w/UcHTZjqAwj
	 aZySe9/C+3oxtVbO+R+hTVfwO+KKUKmFSOgx7Z2HCe3OEj0y6zLese1RE72n4r0MhLvpiSQ/dizRB
	 F/o=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
In-Reply-To: <178963086483.2200502.14463144472620315064.b4-reply@b4>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
 <tencent_0490E1CAA4336214AB70F813325F3020A608@qq.com>
	<178963086483.2200502.14463144472620315064.b4-reply@b4>
X-QQ-STYLE: 
X-QQ-mid: webmail339t1789636786t633797
From: "=?ISO-8859-1?B?emhlbmdodWkuaGFv?=" <zhenghui.hao@qq.com>
To: "=?ISO-8859-1?B?TWlrZSBSYXBvcG9ydA==?=" <rppt@kernel.org>
Cc: "=?ISO-8859-1?B?QW5kcmV3IE1vcnRvbg==?=" <akpm@linux-foundation.org>, "=?ISO-8859-1?B?bGludXgtbW0=?=" <linux-mm@kvack.org>, "=?ISO-8859-1?B?bGludXgtcGFyaXNj?=" <linux-parisc@vger.kernel.org>, "=?ISO-8859-1?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] init, hugetlb: fix early parameter ordering
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Thu, 17 Sep 2026 17:19:46 +0800
X-Priority: 3
Message-ID: <tencent_770E6207ABD8F875322130E7A6D5E1CDA408@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x

SGksCgomZ3Q7IFNpbmNlIHBhcmlzYyBpcyBvbmUgb2YgdmVyeSBmZXcgYXJjaGl0ZWN0dXJl
cyB0aGF0IGRvZXMgbm90IGNhbGwKJmd0OyBwYXJzZV9lYXJseV9wYXJhbSgpIGZyb20gc2V0
dXBfYXJjaCgpLCBJIHRoaW5rIGFuIGVhc2llciBmaXggd291bGQgYmUKJmd0OyBsb2NhbCB0
byBwYXJpc2MuCgpBZ3JlZWQsIHRoYXQgaXMgc2ltcGxlci4KCldoZXRoZXIgYSBmaXggaXMg
bmVlZGVkIGF0IGFsbCBkZXBlbmRzIG9uIHRoZSBhbnN3ZXIgdG8geW91ciBzZWNvbmQKcXVl
c3Rpb24uICBJZiBodWdldGxiIGlzIG5vdCBuZWVkZWQgb24gcGFyaXNjIGFueW1vcmUsIHRo
ZXJlIGlzIG5vdGhpbmcKbGVmdCB0byBmaXggYW5kIEkgd2lsbCBkcm9wIHRoaXMgc2VyaWVz
LiAgSWYgaXQgc3RheXMsIEkgd2lsbCBzZW5kIHYyCndpdGggdGhlIGNoYW5nZSBpbnNpZGUg
cGFyaXNjJ3Mgc2V0dXBfYXJjaCgpLCBrZWVwaW5nIDIvMiBzbyB0aGF0IHRoZQpzYW1lIGtp
bmQgb2Ygb3JkZXJpbmcgcHJvYmxlbSB3b3VsZCBhdCBsZWFzdCBzaG93IHVwIGluIHRoZSBs
b2cuCgpTbyBJIHdpbGwgd2FpdCBmb3IgdGhlIHBhcmlzYyBtYWludGFpbmVycyBvbiB0aGF0
IG9uZS4KClRoYW5rcywKWmhlbmdodWk=

