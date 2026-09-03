Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6984F55A9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456453; cv=none; b=VcFKYI0jHezMSUi/5mOM5fCVatJMBhJ6yRDnNTwZJ3cOb9RieJBdeNI3uySGWOWLCeuqXJ1kaS3/5HAOMQq2HPD1EFGmZ5oVx++FS7x+MP2eg6B4hxq+bhIDY2w652CphFsWPOLZ3SZ5bxJ0hwV1qcW+PYJWHBRXOAhct4NI4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456453; c=relaxed/simple;
	bh=NzyHlj+F1WnazB4+oa+9hqNquIJnPs2apGJceu268FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNsmdBOjEWKGYSufejf/cq1tOI9Mbv3PRXCOhDX91BqUjOnoX5mXKqmakI10Mb5YDn+dC87Wu/hIzcQahTzfQiqyFfZ+FH0L+B08el3kl0AlpJoM1WsTTYyKLXltlUNpqrGlmQKWwXmiLNsic8lenCCwgcR+DUBSVWaPe4x7krg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f31mTfVb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f31mTfVb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5961F000E9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456451;
	bh=NzyHlj+F1WnazB4+oa+9hqNquIJnPs2apGJceu268FA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f31mTfVbMKX3f4GPVuzk0C3Y0RWX7S/tMMwl5EDNyPSO0tK67b9OdtyjaJeK9Zn87
	 eBn/B4BBQpv+Dd2ZCGRulX3fx56DSFeeRgp1TaNF/e+lg6BfpwjwR5dFycj1j53cMX
	 J+togD6TItMtnKmZXbAigUrKKHyILYdfsA0LhYfDIVcDs/YGt2W+O3JYQDIW5RP5oR
	 gbbwspHG8kM4+DRp0L4CaziwHMJPStIHYlUU92UPoaLiBuKKJZxVDs82kWNvSmPv+F
	 inp+WGAJvXcHqaHEa2BEqcsCWalF7ev/GXAPhqQe4vI+yct6m1B9srI+wRoNEPh0OO
	 PAjtuU2N1MgVA==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso29769a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:27:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwPzBrWcfRmB/QfJSjzScUAzpAwia3S7+fW1z0Tx9kwSKKbg9m1gTKjWPjKqUvQQ1ZIPTM5E2sIkJcuRZg=@vger.kernel.org
X-Gm-Message-State: AFuF++kkDw8yocrIhHP2tyt6n996SJ0EPI4mrtqf0iaMoN7Iq3FpnjJe
	lqrp47D/0plrUZGU/ECuViRPB7LF3CDNr7a980QA0jjSjv5NBIs8JeFcsYIpOIk0FJflqT4l+CZ
	aVKduTMM2J3q+na1H9WqL6yTlWKZGsQ4=
X-Received: by 2002:a17:90b:5310:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-39b26272b59mr4877a91.14.1788456451651; Thu, 03 Sep 2026
 10:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902152910.708743-3-manuelebnerli@mailbox.org> <a4f81c75-bd83-499d-9dc7-b891ec9cd922@infradead.org>
In-Reply-To: <a4f81c75-bd83-499d-9dc7-b891ec9cd922@infradead.org>
From: Fan Wu <wufan@kernel.org>
Date: Thu, 3 Sep 2026 10:27:19 -0700
X-Gmail-Original-Message-ID: <CAKtyLkGDab8y4gLCxB8it0R7pJEYk6SF2YDRuhxGwRnoPJCVsw@mail.gmail.com>
X-Gm-Features: AcwNN1UzhA_lKFHBKz39dW7UfnttRnAH9rsChsJlzbrbWgm9FM8-99pn-OxwtcM
Message-ID: <CAKtyLkGDab8y4gLCxB8it0R7pJEYk6SF2YDRuhxGwRnoPJCVsw@mail.gmail.com>
Subject: Re: [PATCH v3] ipe: fix invalid sgid value in audit event documentation
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Fan Wu <wufan@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Deven Bowers <deven.desai@linux.microsoft.com>, Paul Moore <paul@paul-moore.com>, 
	Manuel Ebner <manuelebner@mailbox.org>, Fan Wu <wufan@linux.microsoft.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:21=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 9/2/26 8:29 AM, Manuel Ebner wrote:
> > From: Manuel Ebner <manuelebner@mailbox.org>
> >
> > The audit event example in the IPE documentation contains 'sgid=3D)',
> > which is not a valid Set Group ID value. Fix it to use 'sgid=3D0'.
> >
> > Fixes: ac6731870ed9 ("documentation: add IPE documentation")
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.
>

It's now in ipe/next.

-Fan
