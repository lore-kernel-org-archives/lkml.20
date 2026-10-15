Received: from sonic314-14.consmr.mail.bf2.yahoo.com (sonic314-14.consmr.mail.bf2.yahoo.com [74.6.132.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FD931F99C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106726; cv=none; b=mt19GZ81dfEx+HUgIjcWp8mQ9tjwz53SNUuyiPul5azCydSkXsroxbR8ATWqgj2x1StL4y3/KHTm4PXsHDEswz6CpdU7BuCB8PCuby3TYrxHtJUFaars/mu2f2yVHRZEoiqKj1fSJzg7VoLSe5YWAsxJFWzTNqBBFsFc0h5bzRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106726; c=relaxed/simple;
	bh=sFPY+NE+zzGt2x6uHMfkfI++1+h9Di9RoH+S2GJ7+lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBxptfgWulMgm6WxvLIyU50GeumBFVIVSwrAgSvi/kWDcUaIM3rGVPEA7aOjNmVdApKt8w7pSTV+RgP6uO1RzEJ88RCQibzseYCG6cRZc6+cEwX/ZNJ16ScGznWQ34IO90p8oLHdlWGdmeS/UG0+427/cT6hDKiS08zEFgAyZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Mh44yOXl; arc=none smtp.client-ip=74.6.132.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Mh44yOXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792106716; bh=nfyy4oED6oMdHpMx8K9LFhAAKuoqWIm18K3NK5xhum0=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Mh44yOXlFKmMyZQMXbGcejLfrolWVHxmVcKpUx2DlKWcteliCZf0cwuDFMOKmRPpMebFe7EgmFI5NfQWEE+VidR/1HGKxkV4bywxmqeltIYFWUr/dQC+MulpJ9SQyCXyRV27M7yPVeA0f2qTUnoUxhAixhP5UbFqdYdYFrN9TbOULh3aFSUbupU24cuW2TiBgtuMK0sLznZGPA8fwMjES2Q5yQnh/c6EBT9e+vzzyczBWj2zjrN7r6/eWWVx0vJiH4WafvBd7M/RTMRLNffB5K34K52Fs84mH5yh9n/mE00+htzJnATIgACR2qVhcv3bjs1eazZuhNr8PcfQPaffRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792106716; bh=nOJaUY7+jIK0gFgZxL2namNH+xt7sHEDFQTSdpQLUZf=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=sOolQJJXJcS11yyFFo10TzZ3Mnas6soLAiOnaIUlhuuub32cC1b+Mh3DXoRWTOkSIXgaOZKNU180YARzl0xqkmS5b+8BJBdz1L34pki1CTEq2PfwOZB1UI2l4ulELKwzL2SgM3QkHmkNJ+jPIDXHFiO9rw5xOX7XVHcSCtPYgZcXx80O6ZM3d5qUAEJRRmO/nSaYsKSbfEtOA9RlefvTdCMYtykeBShEoc9Nua4PHjj87Ch3afOEkbBUyVxPIqGh5Y9YcXvlUqvA4Ds7FXkNAhEgDRPuFWsd9TBeXr6QeBsApsYqvRUBecSlfhSm0DGPYLxGFAbJ8Bz2iFQY9wBKhA==
X-YMail-OSG: eaHqIRMVM1kgk7KwMPt5uylUtxr0tZsIhtnCsCTiKoJX6U92Pacbsb4QCiKkkNQ
 h0Xta9PyZx6B35Gzr8DfRLn7b62ALcrXYNKXxv061E0oGN45JdaDU.Y6SmsNB4vBjKTbKmXn0_zU
 q.Bz_YxJhAMLltGwV.1ETHdIzZeCSD_Up8OsG7m2LXX1bYDjW3DOoXzypCy5ox9m_gPVK8EsnSat
 5qzA9cCRAgdZDA0pNY9mHaYetrX43p6kstfc0qcXteRha4_uNJKsalqpkUCWHwz9m.MGyN36XBDM
 87DmLLQfYP..CwOKZymPQ2lE_crAbJVzCzCGsMmoSgsiykzEeB_3dCA2DV0JIc_Y.nF9dkzpaxfO
 4Ql09GNAKnlGcBdFKdAGPwnztwzjDFn_bCqf4kKNOQ1oat_oDXi85l69.GG6oym.QsFZQ9sLPUsq
 V4snGF45VC1iWMvh0YMNmjkJazWUBR31gLV6YSBe7mBtgOyG9urEYSzIUw65eJmmeKry484p1TK2
 X_zexSdY8SbOH2x5uA0OHOHO8jpYt7ff4xJu9Jqq2ZXh2T74CHoRYidRklj9QQGIHv6euuAThvOE
 k0Iopw2x1OtHoKBaW7Muk8Hb4OhVuw11WbL9fEP0CXuAh5SEHBfw__7RDTOZkJK6fG.iKqMG3Xdv
 w0bCMmdRtJXXKI_lM76vEideZmm1JKMB_ade2PXggBqDLTzrgI_Jonv2ypmOW1yus77rilYe8aqJ
 EUY.4Ws15RhL2L9Dp0lahlTKWOa8zJUImpy5tiCvrnZWJTU0NXl3ZWZhQpcoETrbOqVZM8wfE6Fj
 DurbqSxOXp650qp8bqYIGS7Uu57Dy6BBLWf2OoGFHtEhazXlPSPm672STD0j0Fet34mxT37yr8b4
 .mCcdF2R047Oz9tDjlWlmSSrzeEyQQko8BYBjj46do.Lv4Kp5E_BZ3R.lpztn2tGvDIjPwYzVSyE
 zMj.6fOKDkYyLLiFmCe.z6sRypkdmoYylVL.16Yp4HWPXD1Z3kfL49iP7dQE.JdhgCFlHP22fuGD
 dFyA0mzzHJ6myvq0SJCEsUxePPB46IBwrH3a68Y6fMv9IjvLKwak3IBlUDdL8qZAHmRWYjPyAQ8.
 .1RUu76G6O1s4hkQ1JBapCwdl1GC9pebCvgz2DJVHvzLRPUnkCkuxMPGsnBE7T4BwpDn2keGJpDE
 jExQGhKWNsRx8jmBSnT0PYkoo08PMrNANJFXJznCtWofgNL6hS.Nt_nfJCFQeUK90mZUcQ70V8ed
 HvVPjmkpxh2FBpRU60fE5F1hCHuRv2UBo_08ddVmkebVbbUgSQhFFILnhRBYx4H6wFIiocf2T.Vn
 jld0zd0sK5LU5ViCwx6N8emTURFrCAcMpndkA7ABeYn7O2Qtl3PKczf0QYOf5.VfQ7.oLmDYPfFF
 FZvRmoHPmDQTA_Gu3_EfA40O9eovFwl0XwrlQb7fqCSErA0xb.8cNSFOyt1xEiDLsu34w3h3PYLF
 3DBGwd5E3iFbbvQO_ePX7gsVp2Odr9b0ISUsFTxXeUSv3GxXepX.Jk_QuRgi99ZKx_jeuYp0gDWL
 j.N0J_e_RrX.jLDKTmnXC.e4_0YoTw.7YLSsiQWqIPUegsRqPEXWhDyQ_nsOfOKTXIU5cAUB6gqw
 cDSQONrGo.yiPtYvmQXcHHOt1jJOl9NzTWaoPUTvnvX20.2pn_mGIXnN8JStfoYfOVTO7dIi.VwN
 PTvZWJdpZzrBvsv9qAIwn7Lu7XyH6mDbswY361fC5kbYaLb0OwGsVXehS_yvHbQaV179S8mlrKRE
 mtj5.tTk0WcdjsgCB3BZKfFD.kwhoFXCt7tK7.wX66j1wkv4gaonUJRNMuRDni.rZ.UbbtTLVggy
 5XD8h69uUOuozpK3QibU2L1fzFIuxNaaxLD6Mycpiyt2j3_lqKpANptMYSmma8GAt_EuRYVz6cm2
 A7BIlyq.DRD55aK7Fx51ljWJjVUFp07B4EaBehUCknAzPRYeun6JUxH2cFzbij._GGYT8cntMWQT
 LiUiQRleBtoH3zGoIMx73UjVwz51f7ZrXm2q85fcrTB_7p_wzlPb7XbmmU9SZqajetijfHwzRBEL
 tB2BRFfdBuR7OSkr_XnKlffNK5IYMnFMbV7iIgLuR8KAI3idHmpN7YASkicCdkpyoQfkKryvUUQQ
 xRKQaso.HZ1QWEF.jNuRD.a81hIB6YwwBp3hrUF_eJaXbzbWqHvH7F00jX4aNObflEzqISsE_3YY
 wc9.mYmHME1hx4kFSkrwmHdo-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: b6834d16-c8f9-49e1-8ec8-8809110e3cd5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Thu, 15 Oct 2026 23:25:16 +0000
Received: by hermes--production-bf1-6d6877594b-ndv54 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 41b88935f80b471ddbbd921194e01a00;
          Thu, 15 Oct 2026 23:14:59 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: Kees Cook <kees@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	federico.vaga@vaga.pv.it,
	apw@canonical.com,
	joe@perches.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Date: Thu, 15 Oct 2026 23:14:55 +0000
Message-ID: <20261015231455.104217-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202610140951.C3D6CBF73@keescook>
References: <202610140951.C3D6CBF73@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 11:47:00AM -0700, Kees Cook wrote:
> But I agree, it's a statement that says "I brought this to the project",
> and is _just_ a statement. What we want for the LLM stuff is "I
> understand this change and am ready to convince other people about why
> they, too, want it to be included in the project". "Assisted-by" never
> did that. And I've always held that the place to do that is, and has
> always been, in the commit message body itself.
 
I completely agree with removing the Assisted-by tag.
 
Using an LLM, I can ask questions that lead me to understand the code.
It gives me the knowledge to defend my change, and lets me weigh my
approach against other possible ones.
 
Along the way I'm gaining experience and learning the different ways
people solve the same kind of problem. What matters most is that the
committer understands what the proposed change means.
 
People may now go to an LLM to learn about something the same way they
go to search engines (which increasingly consult an LLM themselves),
and I never saw an "Assisted-by: search engine" tag. The tool just
makes people more productive.
 
--
Jeremy Dean Clifton
