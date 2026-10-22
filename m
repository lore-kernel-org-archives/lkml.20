Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699152;
	b=MmAg54wWat3WTju/rorg1nVHmVDyKuvyb3R3qxtMXMbKMKEztGdmXtkcEYeuQKf5EBvo
	 RqrfsoAzXTNaNJJv1OibluirvLCgYfaCXdrwTYAku4pXXFOEOFUONsWT+brg64BLpZKnI
	 SAGD830NgapIdMyiJre93ne+j6LY5fZmxjxT7chwSCnyMsHHPZUXs0cR43dpqymrq4vBH
	 Uo2UNyEj26gW8SMd3kU/sGNvWitJkBigFGD4tGB5CIwWqGXBkXzNXFn1tkJh+0ZrX+kZD
	 x8+UDgDA3L20HEagQXvo1vOKF2qyDZfa5kxIPgRCtsMX3ZBG6dFlw8hLEL0P9opOC1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RoCWPzkDrHJr/dgaCUqN2HXVPucGfm6YZCghqMmtLIk=;
	b=HeKlnNRsXAyNSO9HJxyVToPyKAfIK/HqKwa2VJoiHj2OgDUiRUjBZ7CHhig+3w/02MUq
	 e6lmgGXyczESe7FHs4Qubu0JVFiqFBV7igrg0BVuR0BYwvMhqFNRzVetiMRIinsJQaWMA
	 MvtjLx8krunHnfntMjCUc+jcO1IO4at0RL2MiB/mP8Hy4rz4FORAWffzu5VgNRMnCDu4F
	 0e+YNIB2WIOU5lvWaziIUJ2OsBF3EizTA31VtQA+/CJ5774NSKwpcAm0Hhw7HWxpN4YvS
	 ycticRBGy00TQ77gBKhGu66+Vg86mMGJNOyCCjohN8qxk2beyYZSrEJ8SRoRGBnzyDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V4lejKYB;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD54606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD54606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V4lejKYB
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so190142e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792699150; x=1793303950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RoCWPzkDrHJr/dgaCUqN2HXVPucGfm6YZCghqMmtLIk=;
        b=V4lejKYBxSMGiDWWA0axBwqHGgs0wbJYwTp4ZeJX1alYGcHqK3yuP8GS1u9XorLWMX
         tJhooN6SfCRmOgVaXxdAHweW5GjynhAwet2u1fSk81o4nNfSDa7obUEjo8PgBvJ88WMQ
         96JjoYnGPRUGovzVv4XoBYC4bq31FvnCMOaYyFDDAhPuYsn3ooz01CnkIAGfDVq8elSv
         ozs2JHlZQ85Utr8aWeoCBxPljSvcwlS9+fMXJ64fXyUgNYia8VeuAjcel84OWmaQcjt7
         jBUTC46hb9z2mK5hWmb+iVVPXiLo7SygI8Wj+kQWzsVO7NrYI9QmYSsm5NgIpJcF3qM5
         REig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699150; x=1793303950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoCWPzkDrHJr/dgaCUqN2HXVPucGfm6YZCghqMmtLIk=;
        b=Wlt5UOhZD0AvJXvlpDeg0NYSm3tyicIsmgi7hPQNG0TqcbT3T1KwagiQ7fD5D7msFD
         J+RIntfSPPXUEhETK2poNOx3Y3+BaZQATDU8ysAph+QI1HavB/Qe/d0KifT/q1zvFf9j
         d5NJIMktG8UxnNlrzNdgzBQJgqw4R1ynMgJDgA6rvVvID9aq8xwomAuCGG7qG6y9oPqG
         6HENa34Z9g9VpoK4YjHZSBpu99TVaPJgeHzTQuM3tPNvDVMuoJGQaWd7yyor5uaqfsen
         VlABykYTzLWnmRq5dcwHs5oU77bEuKJVql7VuFkqBmVKDgChuu/eRObezV6m8aOFMJ9e
         OV2w==
X-Forwarded-Encrypted: i=1; AKwUvByqaIIusEGR0fnOexWgtSFOrqBVwIabRBdpgAFbIqBK5TUeqJNoO5ulc0Ave+DoTzHdw3kFMUubpyOBM2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMUhqqDMybsM58E6HA7KT3hqt6OlJOEB7OJXZ4tXB0kY1+atvg
	qEbnF6sYAj2lzFPxLW9YQqr2bT0FRmrYAViG3+8umbKUdnper0zGzTuu
X-Gm-Gg: AYBFou2A9chxAlNpaMnF1p5lbzhKQhOuFRcpYICAQO2IbeJmXzJcuMa4CmT9SE7FJL0
	9BlquTm7CmEYreL0eVXDmiY9r7XDKaNir8N3bQY32LWe9sSfOMOjQDpvat1kMC2jk549cW7LXdm
	6HfzY7wg0ICQdiZ5/WS8HbvhSvmEjAPXeshqyVsREtDZyXMA1xM9TXdSx996NqdoyygqXUCYsqh
	KPpvr24pwBpH3nq0EHIO1bQURsFnIDN6VvGiR6p34yYI93WF1we+cHXIEb3bf74+ijWnYHVULUY
	as4iYtfbbeXwVZT2RGe5pxFm1pv2n+U7ruN0+7aazHVzx4ORaT8+T4kYwpx3pboY2GZrYTlSw8O
	lyEmznKJdKaW/yrFc6Ui7kkSslLVQUZ6NA9RrJn5thbF+ZilTkz4WbR+8GkqgulpVWrQXiuhodi
	N6JSJtRqQ0rtnlLeHDZ2Uf8v2cQDmi0sTVLz7rxopxNNFXHtsezh9oChvlWrQqIbzYKQbEFbISZ
	fI76tw6PVz7UWfuofem8KU6SI8I9jKzVR7ZlxUlnLaNYV1CzA==
X-Received: by 2002:a05:6122:616e:b0:5ea:aedd:6087 with SMTP id 71dfb90a1353d-5eaebd9857amr3050579e0c.4.1792699150626;
        Thu, 22 Oct 2026 12:59:10 -0700 (PDT)
Received: from localhost ([2804:388:90c9:8e8c:18e0:eb4e:48f3:8b3e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13ed874asm131464e0c.9.2026.10.22.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:59:10 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Thu, 22 Oct 2026 16:59:07 -0300
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org,
	xueshuai@linux.alibaba.com, Peter Zijlstra <peterz@infradead.org>,
	leo.yan@linux.dev, Li Huafei <lihuafei1@huawei.com>,
	Ian Rogers <irogers@google.com>,
	Kim Phillips <kim.phillips@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Zecheng Li <zli94@ncsu.edu>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v7 00/15] perf annotate arm64: Support instruction
 tracking for data type profiling
Message-ID: <atprC5YrmbGu5wKO@localhost>
References: <cover.1791629326.git.wutengda@huaweicloud.com>
 <atFdpZG-b2JPS1St@google.com>
 <8fdf2566-bbac-4854-8faf-0276af5f936e@huaweicloud.com>
 <atkzKm_TPnhyzgx3@x2>
 <atlO6EJswVvj76rN@google.com>
 <b6c0b7b2-3ffa-4dd6-a4e0-23333e9b7d92@huaweicloud.com>
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
In-Reply-To: <b6c0b7b2-3ffa-4dd6-a4e0-23333e9b7d92@huaweicloud.com>

On Thu, Oct 22, 2026 at 09:19:14AM +0800, Tengda Wu wrote:
> 
> 
> On 2026/10/22 7:46, Namhyung Kim wrote:
> > On Wed, Oct 21, 2026 at 06:48:26PM -0300, Arnaldo Carvalho de Melo wrote:
> >> On Fri, Oct 16, 2026 at 09:18:38AM +0800, Tengda Wu wrote:
> >>> On 2026/10/16 7:11, Namhyung Kim wrote:
> >>>>> Please let me know if you have any feedback.
> >>>>
> >>>> Thanks a lot for your work!  Assuming you'll fix the issues from Sashiko
> >>>> in the next version, you can add my:
> >>>>
> >>>> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
> >>>>
> >>>
> >>> Yes, I'll address the issues reported by Sashiko and send a v8.
> >>> Most of them are minor, and I'll fix them accordingly (or explain
> >>> in the v8 thread if I think any of them is a false positive).
> >>> I'll carry your Reviewed-by in the next version as agreed.
> >>
> >> I applied the first 5 patches that are sashiko-clean, will push soon to
> >> tmp.perf-tools-next and then to perf-tools next after test building on
> >> my containers.
> > 
> > There is v8 already which should have addressed the concerns.
> > 
> > https://lore.kernel.org/r/cover.1792411435.git.wutengda@huaweicloud.com
> > 
> 
> Yes, applying based on v8 would be better. All Sashiko comments have been
> addressed in v8, so the whole series can be applied and tested as-is.

ok, I'll get it then.

thanks,

- Arnaldo 
