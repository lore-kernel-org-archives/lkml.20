Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426828;
	b=o+829bBr2b6lvXIW7LxmvpyCK+NV1yncD6mmrdxJ0JYrPr8JjKq6C02U7PrT9OdQSfVL
	 tNq4ZfjNhAweC/3Qf7rf7CWFBT4PnMNAQCn04BfRg3tReISXxjuQzvmiQHWrSXmBnHECP
	 yWz+IdYeIjXzOXS26DSv6LbwRCT5PYVs2bU7Rlx6Bodd+eCYijF1a0O9I75ljxMQZ/Z7D
	 +08sP1BS2H8Yoy58VCWZtvUFq2ip03U5Wu1MfD83U3o50lbYk47sQWgPyJJc7s7PPIOdj
	 QLFXVPGZ/B3zX1z4RkpOASL0s/FmAsVTGLODq1wvv/GUmZxAoufMsIzIZWVft8/FLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426828;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9+V3zwWP2ctAms80lrtSl8y9J0bEHrdTUBNayQYF8AY=;
	b=sQzCERruW9/2kdflBHlqANMrwlQfUZktqhWPhM0pR8duFdC9i/jtvGKeWbqpHh3WA5hx
	 XD1a9MXa4i04z456/zBIS4nzp45FiqBNkyOBZPbzWoYScwUr1jygbbEwYE82BLPqaZ3GF
	 dUn2pWBG4KJWQswxK9gPpq1G31xXjF7Dn45DALDyLfqvTe6SgGW0C0i0CESqowwNgiORX
	 9uywCg263fneYo8Y9zBp5iIF3DiQH8MRCCxMlen7RLWi2hUNHtcEqbiACS7wo6+pNbJNf
	 uBoQX1unAXIIiPg9ZcvwtkSEx47QbRGDm4Bjn9EA5JYoPF/5IoTiX9YS8v47CuJgyIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqEDY18u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17374606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqEDY18u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EE51F00A05;
	Wed, 11 Nov 2026 19:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426827;
	bh=9+V3zwWP2ctAms80lrtSl8y9J0bEHrdTUBNayQYF8AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QqEDY18unlA2o1SPFKzDefmcUelA+gy1zBm6nI24LQCxqs+C6LPu37Ssb87DTGkJ0
	 q5Aw+Pup6Uawag8qqvCaXC7NMZLUX1XwaHcgChPno545yuqxHPntPAZqOl1E/HyNRK
	 fBavzkMhg+5AaMpoSXyAJFGb15buwN5z+K0g5UZsI+FUgl0BTIDKerV9duJ2aqv3U1
	 T1RtbmQFZH2lbRln7uwWa4GP6WddzkzpIuq5UlsVQ9j7f+i6J5vBhEGaDIqGbL1U4Z
	 uBb6mQKPqTbOCIfkGT4Mxm2CQQs+h9ob4+aHuzEgwdmWjtXnnV3vSIdpYZADLr/uAD
	 ZpBAv7/MHfGFQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id C7AC4198003A;
	Wed, 11 Nov 2026 14:53:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 11 Nov 2026 14:53:45 -0500
X-ME-Sender: <xms:x8f0aiyCfeXVGyCi9ug4jnThpi5tqkKwpagbx-m6T_Edfi43Iy6pIQ>
    <xme:x8f0ajLoRKQchyVDbsD8uPBhWbxEh-HYBnhPBhsQfaQzZCirodgLnrsVNylHTWn8E
    iOn79CSJePGBhzPhQtUU2KYwwdEQFk7P9QDy6_VjSwomTtKjtO4Xi5F>
X-ME-Received: <xmr:x8f0ah7aN5zKrBuJq1SAHPC3gTk0Oh5VMy5gCOvjscNCIpNrmeJTL-sMhC4>
X-ME-Proxy-Cause: dmFkZTFk3L7XZlF5+7GH502WRsWRu7U+bYuq0I87emmDHqofs2C6Hcc8RGeJn/UwsU80aQ
    Oy5YxXNQD1BqRn8XJ/GTClKi2hastwCjkmd8COFgy1QD6KTMxDorZdMtO1IFTW2oWK3BBJ
    Ud6J7xk6J7MJa+AvKNYZq7fGtXh5bug13QkkC2bMXnBNPwAyDQLNhRrDDptQimi1nEzMvu
    9TRfS/AYmmmzrrSal/oeqggCJbce/BM6qn3UOoa/Yz8qXU1ssT2aJrhmaxkrlctMFW7YKN
    EQ5KIcWt1jqxB2qOtX0eZbldsKebou1BaF/6/y0uWBSjqp4ov2Z+/g/QHKX3gdUs4JZpIj
    g6gPfA+H5faF09ppkSkY+6L7Hdb/HYFEtGOIq3q3a2KuWgSZNxWsFbeKl3LAByY4oOiqhj
    B34d0BUoUpfreNUO3uAT+MGxdJHWl0K7sQVmYNnCTDeQVmPyoDUZVMiJQ6i4aWEPYcQn83
    4aoSnc69Gxs+HvTBiYEpSV9UWELqBN4R18h9XxAM42kUav2Yxvbjcw8r6oqxnigVcTSvKp
    iwe8mMLREybAHPyDO+qIM9AofTNL3GERFVtc/fdeMjFU8DeesspO1OiSjNOVK2ZOfVCcI7
    Ri1KC/anUqpFspDwXFE5oVAFNgi2wKvWPt3hCw62UxGNakgUKiPteSzR2MCA
X-ME-Proxy: <xmx:x8f0aqmiCdZsxSv--RgHZ2FV6V3kBhg7iVxeEM_XLzdNVot4Pjilgw>
    <xmx:x8f0ajJxUuhB86g3eESVIXZRafN9Ymn-2-BOOKLHI76XRxHDAsOMew>
    <xmx:x8f0arFlD4FqF_vAN_45ugEIfFa7VxHG5tGvFamumUjHZeC7C1PTWw>
    <xmx:x8f0akOS1E5dLyR--vH9rDZ-YRqQN9CG0p5M_bTGLNgD4WBjsSW_iw>
    <xmx:x8f0al-Jiu0Nr7VSnOBMnuyCfJRr4MLTsSY2cQT7qtLl-FcrooCeQXL_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 14:53:42 -0500 (EST)
Date: Wed, 11 Nov 2026 19:53:41 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Tal Zussman <tz2294@columbia.edu>, n3rd <18670333770@163.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "ljs@kernel.org" <ljs@kernel.org>, 
	"ziy@nvidia.com" <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "security@kernel.org" <security@kernel.org>
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
Message-ID: <avTHmQXzWQagnsh5@thinkstation>
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org>
 <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
 <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org>
 <60029f5a-091a-4022-ae48-8fb9a00d922c@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <60029f5a-091a-4022-ae48-8fb9a00d922c@gmail.com>

On Wed, Nov 11, 2026 at 08:43:47PM +0100, Jose A. Perez de Azpillaga wrote:
> On 11/11/26 8:29 AM, David Hildenbrand (Arm) wrote:
> > On 11/11/26 04:19, Tal Zussman wrote:
> > > On 11/10/26 6:55 AM, David Hildenbrand (Arm) wrote:
> > > > On 11/10/26 12:54, n3rd wrote:
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > I am reporting a security bug in the Linux kernel.
> > > > 
> > > > Stop sending uffd problems as security bugs. STOP IT NOW.
> > > > 
> > > > Tal has a long list of uffd-related fixes he is about to send out. CCing him.
> > > > 
> > > So this issue was originally on my list and I had a fix for it... but it was
> > > REALLY ugly and a band-aid, so I dropped it.
> > 
> > Yeah, RWP is a mess.
> > 
> > > 
> > > I think the real solution is to just add actual markers for RWP and solve
> > > all of these issues at once... but that should be a separate series from my
> > > batch of fixes (which I'll be sending shortly). Is there a reason RWP
> > > markers weren't done in the first place that I'm missing?
> > 
> > Let's ask kiryl: why is it ok to drop RWP PTE bits during swapout, zap, collapse
> > etc?
> > 
> > https://kernel.org/doc/html/latest/admin-guide/mm/userfaultfd.html?utm_source=chatgpt.com
> > 
> > states "Unlike WP (which persists via PTE_MARKER_UFFD_WP), there is no
> > persistent RWP marker today. The user needs to re-arm the range with
> > UFFDIO_RWPROTECT after any operation that explicitly frees PTEs."
> > 
> > But requiring the user to re-arm is rather questionable design if the kernel can
> > just zap these page table entries.
> > 
> > @Jose, maybe you want to look into marker support for RWP to make RWP a bit less
> > horrible?
> 
> oops. I overlooked the thread because of the AI report...
> 
> IMHO (and after reading Kiryl's email), I'd fix the doc instead. "Scope of
> protection" doesn't mention collapse or shmem reclaim, and it still tells
> the user to re-arm.
> 
> I could work on that patch :)

Thanks for volunteering :)

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
