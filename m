Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994409;
	b=zvD7NEUG9kPLHErHhDPnCzd4NQ7cga1TFLB4ZKYu75bnYiwXaEf8JyQdOe7nzIWS87Ro
	 BwgAVmeHXGlZCWoAGRkKDRAISYFTDCX5faLxF4tJlr3jhiJ04kNnBdnE1KbFzUN8hXvdW
	 ZYX3UvTglnTCd7QLU/qgt3HDd4D9fPB3sbZtn9lAOSycDMpDChDVSBmyg5Pt03kud1Z4k
	 kBsQCj7tbe0F4zhGwxc+r8o/6ZkcCt973ZKrK5IcWrv/OlyNM5hvofPg9m3HF/4UA3ZNL
	 bi6ab8ykRxVXLRDSqzKM/erGremaPnmN6SkmmK8m6A4CAPr47SMyXOK1jbgLa5owANg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994409;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=qhKoxva0JL+l8sDegVq+F6O0qeFNZ5Zg3O8huHi3mM0=;
	b=uYPwM2V8oPXc0CkG3haG7Ne11/TIVY7TBiceQlYXlGahILhRER90rx5jpYWcc+WfOUJB
	 EkXC/bADovrc6CJQMit/2Tktjo7Yn0oylktkLhAuaVa9E38c6CCSLjjn0wHgNxZDEU/5w
	 fQjmPdGHB8N2PvfEgx2mDbiLVuDWAvlKbzt2lKX0FFiXw0XJWV8wSLkiRB7wOOIEC2/bP
	 CQzULSlZ6i4zQ3v5+J837NGu3bMO8Jq6g0qQcnOVA9sAvIh/83mA6R/03sUL8Aw6BfOS1
	 mY3vnCzIGw6ZjRhX/Z3jcokAstSWvKtWdjWvSRMbYuBc3IufGW0wGmPI6q6XE6QN9TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readahead.eu;
	spf=pass smtp.mailfrom=readahead.eu;
	dkim=pass header.d=readahead.eu header.i=@readahead.eu header.a=rsa-sha256 header.s=fm2 header.b=ag2Z2H5T;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="WbCGlWg/";
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E2606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B33E2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=readahead.eu header.i=@readahead.eu header.a=rsa-sha256 header.s=fm2 header.b=ag2Z2H5T;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WbCGlWg/
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id E3281EC0854
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:46:42 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 06 Nov 2026 14:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793994394;
	 x=1794080794; bh=qhKoxva0JL+l8sDegVq+F6O0qeFNZ5Zg3O8huHi3mM0=; b=
	ag2Z2H5Ti0ErRYro1uqfcVsQLshlA3jWD0g8g9qfGfL1maXy5+q4FQU+jgyev3Xr
	RmtIbH6AdOVvGyanXJgpIAqFbz+HctLRgRqb2cxdEMJBw+g7IGde9jH3cF5IZ4BS
	Y3hJI/WSOc2BU8CyYXbN9Y926BZpWa5mdfueI1iHhOFJCAFIV///2ql7AOGUaEaj
	cWinNQIUfZJ8dyaGWTfd7Dv+AA7+TEm8ejvwGKg/1tm6gnYLaT79TLq2YHnAMcfC
	6JkAwoenbKTif6dCiwPllfWHuirkaa/EyQNr0ddZdYIfhMbG55cmUrENHR6SphaO
	LGxLpAGEf063GBZ3w+1bGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793994394; x=
	1794080794; bh=qhKoxva0JL+l8sDegVq+F6O0qeFNZ5Zg3O8huHi3mM0=; b=W
	bCGlWg/gc/GYzyDYF9V10w76mEB4pXNz/yllOVx1JvJoN042i9QLIyYX/psmtdl7
	0mMcTbGqK8N4kR3F+OH7pLAXB8BRgaDH5S9HvFsvvfnIwql9m5unLub7LujogHLr
	clPb+t3TaoO9NIG+433gs3xpu+eeY6i0Ol8PbQ+R9/3GqohjaX3nk4x+2JcCbzoq
	ZQV16IUS4Hcz6J3qC7Nxkx9OwQvSym5Lw5gMrxGV5COnfGQwzMeKJsR4gLQjYPWp
	O2MIbF8H0WyQ9ZYpsmnsFRtLlkdfFmsRbW7WLmJE5zR+qyZx3dabQr3OFYpJnHpB
	sf1uW3Z+D/bH0eYzlFRCg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=readahead.eu a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793994394; d=readahead.eu;
	mf=PGRhdmlkQHJlYWRhaGVhZC5ldT4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:CwXa0BI0LdAdR9StGzRkXZVbWb+UDE6B4S0zGO9jQ8tIoiq
	TH3oofZ1rMGb7u230oEPdktRw9R+Ib8hyXlIUo6hZxx1ky3fxgtw6OTCK9GdUo1Y
	F6GKe5Y0PE6rmxJlixWdlFa+blUWpYkMgBVCTSk1Bb5E2nIew3p0Ax1bEj0F8Eu4
	ek7FEK9y3frcYGfajPGuk84qDoeE30ilSzYZZGk76lIYAy9Qww/xNztN5zVUPKfN
	2LjWyhVw9s0ZJSgq5dWMT19dVoolKFBx7C/VypCxfzQLei8d7H53b3v7Qd7sU2Jx
	e4lKC/Xi0FVDi6tp8yReVPLk1rFpGsyMwaNe72A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ZXYMNTvVJSIN7d7nypu287vHLlCVFtx1p+56iwTdm2U=:YVR9YXua2pXGceoVU1tO4HWt1dT9IBqHvzi7bV/+K30=;
X-ME-Sender: <xms:lC7uaiy08CXPYJX_-oMjkrCLTLCvz_9vEVHdF9JV-aQZcfo37H8XNA>
    <xme:lC7uapESe4X2r4-9tbosgocOP3mUXBiaG6Bj9W74leR6UsXMdR3n6Eh5MK1FctiV_
    4aXtO1rwrCdNhwcwoRbxa0hkth5g0M9jTk4fJm5CUfFqHk-VvXgWvAM>
X-ME-Proxy-Cause: dmFkZTGUo7IC6fGRL1KVNl4H3kKPTqlVG3UIT2AdgMMD6pZ2tEb1YktnY/FHMj6Q5TyF8S
    4cPLg+L1p6KVN+PKIKLa6P18N3Tuw2cahYHmZHUQ59vKq9SJUxlw8rmWe8DXJXQOEdLs99
    U1c0jX4tkCS07Q0pBU2hQOzLWuCpnoF4Sd0SbE7swUwx5nbO1uIuYHYE0GB9cxqJZA7jBA
    ULB75RlnzHYXaUIAVbS1kVKhGBdzr4ZFrGFbJNXjXJ1aGEpxmH0KT9naxZ1oH/T9jP7xSn
    /fzjAAPjNRojDUct0j6UDS8pDqdDK/UomwyxVtV7L9toWyEJYSSbG3S5/2ypOIdY4MwKtZ
    zybKxSTT2yfOBX70vjqtGwKVX64NrDMFqeC41H+O0uIQs+9wiD5N/uhoOJMaWHvR+EKiY6
    YHkVId0B1PrQCuC7nx9cDRHeeoWvietuEokrqBrkTQqAJwxKKXFmh1z3z+H2vqV7F2GASI
    5plmwvEfFKK4eo5WPkzpnT1vFb7nyV3ZrujVNdKexZadm3uVVGZ9UMJqm5tuUO6nHxj0Cr
    GVlHaDDpANsqqxyHdZgXD2eQ1Dk6VBv3M9i+Qk1Gi5axtYWjPemSyXSegoekVDREJpCoT0
    jYoIyDcoQAC+AmkdsvXb32LmtX/+ZqqjHYrqVtWUxGdLWvhAgu2ETjpuapPA
X-ME-Proxy: <xmx:ly7uakESJVpTbvlQpkTh3h5TN24Pz9dEfjXw7iokr1dFh2XQxmj52g>
    <xmx:ly7uauvCNUSmqjbus2WAkxD1WNAAR1RN3n0DsZT28DNv7BMUh31tYw>
    <xmx:ly7uanbfXW4c8hS5uy24KQdRDX_10cYgNLfvTiFFU8tcwsozohhIVg>
    <xmx:ly7uauXfeq3jiR0atVVOrlAPquBYDiD3JfUAjpDggUaVAxH8j1M1lg>
    <xmx:mi7uaiK-3bDIvhGZDRgh3uzguemoevRUSBWP3S4NschLy2i6ZmjxcjxM>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4F08A32A0097; Fri,  6 Nov 2026 14:46:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AWOKgKtlazLR
Date: Fri, 06 Nov 2026 20:46:07 +0100
From: "David Rheinsberg" <david@readahead.eu>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "Hugh Dickins" <hughd@google.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, stable@vger.kernel.org,
 "Chris Mason" <mason@kernel.org>
Message-Id: <2c95ecf1-058e-4d81-9de5-622e32dc57df@app.fastmail.com>
In-Reply-To: <20261103-fixes_core_2-v1-2-f332954f1df4@kernel.org>
References: <20261103-fixes_core_2-v1-0-f332954f1df4@kernel.org>
 <20261103-fixes_core_2-v1-2-f332954f1df4@kernel.org>
Subject: Re: [PATCH 2/2] mm/memfd: handle GUP references reliably when write-sealing
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi David

On Tue, Nov 3, 2026, at 7:31 PM, David Hildenbrand (Arm) wrote:
> We made a big mistake when introducing write-sealing: we should have
> disallowed *any* file mappings while we are write-sealing. Write-sealing is
> usually done by a producer that wants to hand-off some data to a consumer.
> Having the producer have a read-only mapping (private or read-only shared)
> of the memfd while sealing is rather odd: it couldn't have been used to
> fill the memfd in the first place.
>
> Most identified public users don't do anything like that: they either never
> map the memfd before write-sealing (using write() instead), or munmap()
> before write-sealing:
>
>  - systemd's journal writes, fwupd, Flatpak, runc, crun and
>    containers/storage write to the memfd without mmap'ing it, before
>    sealing it [1,2,3,4,5,6]. The FD consumer will not access the memfd
>    before sealing.
>
>  - dbus-broker, Mutter, Chromium's Android linker, KWin, Weston and glycin
>    map the memfd file, but unmap it before sealing [7,8,9,10,11,12].
>    glycin retries sealing while waiting for the loader to unmap.
>
>  - go-memfd exposes a shared writable mapping before F_SEAL_WRITE and a
>    private read-only mapping afterwards. Its API explicitly requires
>    unmapping the writable mapping before sealing [13].

When I wrote memfd-sealing, we had this use-case where an application writes a buffer and then shares it both with in-process and out-of-process tasks. Only if out-of-process tasks are actually involved, the buffer is sealed. Otherwise, it is kept unsealed and can be recycled. Hand-off to other processes was optional, rare and asynchronous, so sealing could happen at any time. Yet, we wanted to keep the buffers mapped to avoid costly TLB flushes. Mappings were readonly, but writes were done through syscalls.

We still do this, but I don't think any of the open-source users picked this up. I did not follow the folio changes, so I am quite unsure whether the implementation was racy from the beginning, or whether new infrastructure introduced the races.

Can you elaborate why folio ref-counts are unreliable / unstable?

Thanks
David
