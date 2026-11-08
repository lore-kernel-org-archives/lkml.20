Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794108739;
	b=avmjZucAyI2nkWzOwMN+PayCcAbx3kkpiCywLYex5OpYxYDuTACSqZgxKpI/pSNbwhDW
	 xzVnmNJK/1kZwr3aE1mD7Dwk/NCN3HnRy8RXA8ytaLBvkTOLGcRTVdXLF5SI9AfcVrGhj
	 xEok82tMcy9a3V2LXQGo24vcEaCMo4ak9UEul/wu455R4nqtBlnBQCQUj8Bf0s9OFTAGy
	 5orRBNH/PrHfNF+qcwpDac06wvxVf2qzbDXZL14REIquB60jMi82vMebtV1wqm9jLxvTt
	 3dA/r8QZfQKK+oK5KzAp9ukdHxnHc5G6la1rnOA9L9Pshv1TZ+y9jfKhUF3ntMUltqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794108739;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=sMgYg4E17AAmgrKWFGhezdfXsBcg6j0t8FP1Jh1vc/g=;
	b=kmm4y3lPzGgmvZMfEnFfN2YILhphDlt7yIj7cQg8Q1A345xgucBw2ZPc4hMO8ibVSBjI
	 8hzC6Ywhs1g0Mr6J4vcZX/fWCsNE4IinGX9xfurQc+obbWfdpw32DMRBU2E7l26hAIV2B
	 fuKdByvSZq8PvMa33IHPI5qAsTQTM+3oj0x+HKqIRFcpDETlox/3pZs0MdeUSgeaErAjd
	 VAh/23N3CxKaLmSyUxDhZthrFBLaEtP147btlcpsoN5hnoXsav1ZfynIIKrrI/lhV6gc8
	 OzE76OZ4EGSoJwVpbXX+O62wFTKPU6J/W1OOHk0kkYzRnwXmF8K1gEkcQK2D1IqkQYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mUnMdPT+;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240E4606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 240E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mUnMdPT+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=mUnMdPT+XI1DQrHK5yKIWP0Ixjsy/WlpluMwu6spYXxtHbUvQMFQ3p/PWe3oBOPjdmhpN+ZcIDn4f
	 QgSWWXaiJB4FC2UMprD5FEm/IaSK9RbCpQ3AUCsUBbq33zsX+YMVInpwObq8K7nBRM/zj/W4MzQoxD
	 S78JhXgC6hrGUTdU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56aefed3e169-b75d8;
	Sun, 08 Nov 2026 11:32:14 +0800 (CST)
X-RM-TRANSID:2ee56aefed3e169-b75d8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from cmss.chinamobile.com (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6aefed3c277-5b9ed;
	Sun, 08 Nov 2026 11:32:14 +0800 (CST)
X-RM-TRANSID:2eea6aefed3c277-5b9ed
From: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Breno Leitao <leitao@debian.org>, David Gow <david@davidgow.net>, Tejun Heo <tj@kernel.org>, Ryota Sakamoto <sakamo.ryota@gmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, Marco Elver <elver@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Kir Chou <note351@hotmail.com>, Lorenzo Stoakes <ljs@kernel.org>, Borislav Petkov <bp@alien8.de>, Kuan-Wei Chiu <visitorckw@gmail.com>, Petr Mladek <pmladek@suse.com>, Eric Biggers <ebiggers@kernel.org>, Guan-Chun Wu <409411716@gms.tku.edu.tw>, Andy Shevchenko <andriy.shevchenko@intel.com>, Dmitry Antipov <dmantipov@yandex.ru>, Thomas Maarseveen <maarseveent@gmail.com>, Nickolai Zeldovich <nickolai@csail.mit.edu>, Thomas Gleixner <tglx@kernel.org>, Adam Harshbarger <handyhandyman.adam@gmail.com>
Subject: Re: [PATCH v3] lib/tests: add KUnit tests for the priority sorted list (plist)
Date: Sun, 08 Nov 2026 11:36:00 +0800
Message-ID: <20261108-plist-v3-tags-1-yuehongwu@cmss.chinamobile.com>
In-Reply-To: <CAMuHMdXGh0WfSPa1d58kGPXtXXf8LQ5LBFo8qj+dndnWeB9JcQ@mail.gmail.com>
References: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com> <20261106230658.69acd5b571d1ee361cc2c849@linux-foundation.org> <CAMuHMdXGh0WfSPa1d58kGPXtXXf8LQ5LBFo8qj+dndnWeB9JcQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Geert,

On Sat, Nov 07, 2026 at 03:02:58PM +0100, Geert Uytterhoeven wrote:
> I don't think any of the above tags are appropriate: they are not related
> to the reason for creating your patch, but merely review comments raised
> on earlier versions of your patch. Hence please drop them.

You are right, and I am sorry about the Suggested-by in particular: you
reviewed the patch, you did not hand me the idea behind it, and I should
not have put your name there.

I will drop Reported-by, Closes and Suggested-by.  The 0-day report was
about v1 of this patch failing its own modular build, not about an upstream
bug, so those two do not fit either.

Thanks,
Yuehong



