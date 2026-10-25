Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.71.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792919086;
	b=rEPt0OhMyPtm4SuZ+pNO/7OJcTkursuCK8JwNYEHe7JaX4e8ei7n9VvurDcjj5omRo67
	 WORL7rVTFyD8rbvxuMR3kRqsNbQdwP0h2NYnc9SJebtdFJoo/kACJ2FrYnQFXzL0O0ETa
	 9MWcm2/1WV3ydIAhBkvr3okwueZzJhkwS3fTZuIsK+K9FyMuPRVKQD9TLtjYQ+b5b1HnB
	 ooiCn/56ve3M4Gc0ewNmaeA4bMOC25GcF6/FlYdguMrgqqHJIkpUpAHct1+eCcwj9K16q
	 v8fdmMVnvCCKNrbpcTY1ZTsPdnmaFtiTOAjt9fIXAS72qkeePocypbMSdVz9OO1jrYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792919086;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-JNJ;
	bh=tOi3xKFuD5aMiykE6n/is/ksMvy+vPNzfzFiKL8PDQ8=;
	b=tOo1RudB88WeiFcmGYU93ZRsl7yefo7NIrhkRucvIQqUB9/G3xfgmu5UAPCBDjNli36j
	 AZ/bvHZBoRLCnjMzgc/mDOKxtIXHgZz2DHn0zNA8iBHJhTlci843VYtBXFGRYYsMdMxvH
	 rxfGgCYjtiLzHZ/+iqww1OvfvmsMJ5kfFX5hDszjhSenhsRg6sa2CwgibWazHHdFmo/X3
	 DL+Qm2sJPYOnp3OFIWwn16dggryh+TLqF6gStEpsXi+5CLVA/Ir38EeOVUJMAV29P39qL
	 vhkKrM3D/1eesUcjfa4hd0+MSve7tHFpfNS6zNXP6VW1l+DWNnsmOuG0UBOspPz/lfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=n8KPW91Y;
	arc=none smtp.remote-ip=57.103.71.17
Received: from outbound.mr.icloud.com (mr-2005l-snip4-4.eps.apple.com [57.103.71.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F392606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F392606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=n8KPW91Y
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPS id 708E118001AA;
	Sun, 25 Oct 2026 09:04:42 +0000 (UTC)
X-ICL-RepId: 01a1724e-158a-7570-8328-3c57c632e5f3
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQtJCkMGXwFeCEADQwZbC1BcHA4XXhtCFUsVXANcDkswUBtfAkIPHBNWFRMLU1ZbE1UXRgkZCF0dGQpQUAZTEhhcFFxQWB5GElYNXQkZBkBeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKV1MECj9xXX0/Hx9PSB5ecR5yMmstaTd/Knw3FDVwXAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792919085; x=1824455085; bh=tOi3xKFuD5aMiykE6n/is/ksMvy+vPNzfzFiKL8PDQ8=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=n8KPW91YdrPL43/7QW+3LMqcJ10W7LFjD09kvgC+lUG3DVktJ0AbAofUPvfpO/jDPKulgwGac84lpL42JNT/FL+/0XyMuYMvQsavYg3qq5OIyeLT/t0E1taWWaume0k9xU7vOpymZBERMbVJWP4Kmp/V1cE8sMVFaHxxq2hg9D/LTiVRqNRQRo4qbEdHR/ct3E4Lxgt32nRGIms1031Q6jukpRyHX6VjDM/+mRlBwX0RpNI5f5kKfwXFNvvbLtl6drrCjmM3ry1hTHJl7gaYYebua7+D5TuXjvnNo5BboDwYBeN+JFFTSSWYyVX3UqE6A9DwcKdUzPP9pVmpfw0SaA==
Received: from BRUZZHANG-MC1 (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPSA id 3EF1518001BA;
	Sun, 25 Oct 2026 09:04:36 +0000 (UTC)
Date: Sun, 25 Oct 2026 17:04:30 +0800
From: Zhang Peng <zippermonkey@icloud.com>
To: baohua@kernel.org
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, bruzzhang@tencent.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, weixugc@google.com, yuanchu@google.com, zippermonkey@icloud.com
Subject: Re: [PATCH 0/4] mm/vmscan: refactor shrink_folio_list()
Message-ID: <at3GB0JT-ov0-3Fu@BRUZZHANG-MC1>
References: <20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com>
 <CAGsJ_4yBqZVfrpbXsBJDHhitsHZEGWJhZsHG+uKC+QDxZp42HA@mail.gmail.com>
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
In-Reply-To: <CAGsJ_4yBqZVfrpbXsBJDHhitsHZEGWJhZsHG+uKC+QDxZp42HA@mail.gmail.com>
X-Proofpoint-GUID: J4ax-FlMMK39gxb3GUctmllKOJrnaAdo
X-Proofpoint-ORIG-GUID: J4ax-FlMMK39gxb3GUctmllKOJrnaAdo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAzNiBTYWx0ZWRfX7R7+nokb7lNa
 T/q6Tk8GWxG5n43ok+XW/db6pcVC7RxE1QOJmD6k4HRMThuk/1nN0czPPCArBjCpZgCsiRYaPh9
 HyV3HEsR+rW7o10w6qNYJRVGkzDMpJDmSxhhRAUuigi7K7Yx2rs827R/E0ywBcwPZUumhGziNHr
 ewkiH9VwL+j09eCgprJwqV3yDbHD7W6iUnz0+q7TGxSaLZDst2XfvGHb1QYeczxNh5vh7yGKj9T
 GYWeqdMxqUeAchOt7ZHPe9x8ax5wc+HFgoYbQDCYcy2FAVLTF8sWuB3L9bHGidxUbhC+Amw1AQI
 Mmi6lWBOXoeA/T8Zx8Sn4yONbtUHzlRTfaCdkx3K7c0B8c2ahrw4s/kYiCniHc=
X-Authority-Info-Out: v=2.4 cv=XNo9iAhE c=1 sm=1 tr=0 ts=6addc62c
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Jl6AdROc3aInEt3dI9QA:9 a=CjuIK1q_8ugA:10
X-JNJ: AAAAAAAB7lLXznPVkUscheJRJVg9F5pRpohOmOK0pxzqWp9w7xD8HljBKTcodAQUThZib/2VfRmKgYb/Ga4NyYaybJeHreEf/skGnG4m/n3EPFunCsNLFz7o5kvydYoOwqcs+Mn4/hKqTwwOtlAhpgzwP6rxCJXVbj7kz13K0V1Wogh+wQcHlhip0gjjzwe7shhj26aev3urv+ijaFNyd+aWdgAYyzT77n57x944QubWIe2OeWOjfiInZh6C7/BZ4nrpvHsnr8Qa7PIRkQiso0poPWzSJ1vjfldqlKFBpNIS8CTYzRaZzqXeaK2+3D2pddUBXIISDb+gxXqDJgNOrbir1l1yZE6sgdvI06hsmc4f+3PCo4CgghfVg2ZW1I6mfseOpDkyC8FZE+Fq5jedl8ljtP2FmR+uE2556CFlxGfiRkHe6dbqepykaKLJ8ll1Gx2OwNbUkI33O/vTQS9Sw8+rULlikoY7YAPMXTMmd8ZX848OPyrfRujHX8VRo5oPU9sa26mAIqaM3a/64DLo8N4g/MBdf7HeOxQ29Ksq0XCtHGHJzlzS6gRAmGjSko42/sfOH05cckktF61MUjyFIfHjLaIxt6u+O6bN0ygJhPib3qIrNQgCfP2iFFi/GLNPk15JtZ/lvZvt8epf/dGY7mFvzeK+4hSQTz67QmSESHg88VVyjw7vV3YLBVjImMFzXlWZz6yxQejbFh6C9z+TrNgEE51adigH4OIQjALgmJoowfRFzAgxWkK0+5hm17VQoxmtfPzf1ZZobE8fy+9IlLIs1wiqDcQsaZx2Im2FvE1tdwqQguYwxufOnKLSdkRKGOC41A8IWgW9AHOb04nTUVTirPy5V4qng7hk+3OrYuPKLuLMLbPRHoOYYaTm1lBIF07NNjAzdQyr22eF8Pa01HxV51U+DWdH72TrN2T+HdddlzROPgCagaLjbq9XuuNt5LfrfEMnnZFPFe73N+rv44Tm2c/PwWl
 pHCikqwXkaFCc5gZXKclMwJplmIf/IfeSfjJ8D7+x/CX6KADw6xnnMVi58ytNhQRsbXbfzvXoIOd00FJDgeCclYZWz9GlUlp1XnfATlnPAypdOCReMcULnvHHTNqpH7J6Y1XEOP97cbzek/8okyEdJ0ukzBj9QBuGBTDeQXg988Wq7g66sLkaWPpSK51I5Waw0aCpJkv3IKEpXTyj9wy6TOe6LY/ja70oMkO6sbN/feqGIjX5yNRmGl3m3nknR+3KkQa2RHmM3lzfKA73pnu4EgNpHAcU3alNYMTdrBfMwgm6XJAT+bHUFiOqCbMh86bMWdO3LtIeue2uTcS8516Oi6Ma8w/amwrM+ibu7poBaS5u6y0MVoc9hrYou/XCZlg++ts8hHhvn5pOyGq8Eq7RYcceTUqzfStNaxTo0WPc/8MTe9j0GOO5wacnBNsSJJt8SjZuXFiVw7difvLRykaCt0yn+mjZWeiN1yQkeEbPLeKOThwNQk//vtc=

On Thu, Oct 22, 2026 at 4:47 PM Barry Song <baohua@kernel.org> wrote:
>
> As suggested, I think it would be better to include patch 5
> ("[PATCH v5 5/5] mm/vmscan: flush TLB for every 31 folios
> evictions")[1] in the same series as patches 1-4, since
> patches 1-4 don't really stand on their own without patch 5.
>
> The whole series is a really good idea.
> Looking forward to the next version.

Hi Barry,

Sorry for the long silence on this - the series has been sitting
longer than I intended, and I should have sent an update before
now rather than letting the thread go quiet.

I agree with folding 5/5 back in: the cleanup only really makes
sense as the groundwork for the batching patch, and keeping them
in one series also makes the ordering self-evident. The next
version will be a single series - patches 1-4 first, then the
TLB batching on top, reworked against the explicit-outcome
helpers.

I'm finishing that up now and expect to post it within the next
few days.

Thanks
Zhang Peng
