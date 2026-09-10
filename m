Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E22492E58
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049104; cv=none; b=uNAkzQj292zErfk1BvxnaDi8ursNSEwTGg5aA8ScuCvugP6jqV3fGLv81md1VRK2axqhrILQYoVxUn6tQTxEjPpvnjOgSa+aAgPz6sqLNJmwQ/5ZcQZ360oyM6al9JM+mJ8Pi5sbkkRDhHmAhlFq9A+hj7Iv6oOJQjysvQSBUDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049104; c=relaxed/simple;
	bh=bmbZp10cNDqVNfgj2/1lbTZerEuEX6pqCeXNP3LSFAY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dWtYOp0B8CrXG7FIKzVza2BRyUFNb063i2wmp56UwyqMNzryc0Bb+bNY1sJW7A5tys8XncysfsJDzLbtxM9MW/il5m1+j6NROyHp27C4DRM6tANHbj1QFUop9T9OgG7eskg+CO0a1zNqYk8Ii6TMMeDMci6fZg9J+v+VY9lr8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=KTZPnSy2; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="KTZPnSy2"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 68AE455P2182272
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Sep 2026 07:04:05 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 68AE455P2182272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1789049046;
	bh=bmbZp10cNDqVNfgj2/1lbTZerEuEX6pqCeXNP3LSFAY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KTZPnSy2K5ANWXiRh6p4lAZf3xzzO/YODaU51W7fHLpKLjO43x5uBhGiduvK/khSp
	 4hFjaHV/StgTk5AKzjWfYIG9VUeYfMEOx/22Q3dYKviUw4aKEVFdS7cg+hGCd3s2T/
	 GaaAq24W10ZT7vzNVRqh3K3Z7WWPKzVijpXGL8urAbzP7McdeEo4L02fLVubXTj7vc
	 bZn+bixjWxptAcH2+pZVEDLi03MMBdxlqSovjcdYlMdi696xqol4afF70CcIldcnJb
	 fgQYkx2/6sRe9PTvO8WuSlaQu1o/QGTu9zVFNm0oEXjPoRrb8FjXL1X54BeZ3YaOVv
	 +EPo8Oz9lqULg==
Date: Thu, 10 Sep 2026 07:03:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
User-Agent: K-9 Mail for Android
In-Reply-To: <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com> <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com> <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local> <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com> <d1b9ff734b918889eaf8885d64141bc3@igalia.com> <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local> <c955deded411defba0de3a1f6daa78b0@igalia.com> <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
Message-ID: <13B381DF-68CB-4ADE-9810-8586C73D7F72@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 9, 2026 8:38:10 PM PDT, Borislav Petkov <bp@alien8=2Ede> wrote=
:
>On Tue, Sep 08, 2026 at 06:06:21PM -0300, Mauricio Faria de Oliveira wrot=
e:
>> Ack, and to confirm: not rename the existing one, either?
>
>Nah, concentrate only on what you're trying to achieve=2E
>
>hpa can send a patch ontop since he cares so much=2E
>
>:-)
>

+1 :)
