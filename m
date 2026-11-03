Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675024;
	b=ry/vq6ykMiPpSBuvpaX04boDEKfFfdrAIhkOBIrO1qdWuuAsknOJ6lz2VeEVgeJC06Kj
	 SfTTok77XE6Pdd83IErkTaOPCxkG/sa9OzCbA9mmL5If1ZqPa6brErF9+8rvkMRXzi/w/
	 mzFas7eZs/oSV5UxRVhTZFrPZCd5H7YOSQwa7xtwMKn9yXf1Lvzi1fBibJ0akkwowvkDI
	 6xv0DBmN/lbUQQAv1uOXejX8aaxP7M4LWrC6wc4z5gNzrzXYsqsXNqa7eJC/zj0VBj50t
	 sc1zUE++4eRL6+jBBPexHb6jgKULAuvX/Mj31SYWDXH5Ckt58ng0sMIrwC0aqpoFQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675024;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ooyx/43cfLO7FTK575kvS4RSBtp8mYfWZfw4OohOomk=;
	b=1HMFFzi0juru9wnBAgM3q2wudwkKnGtmUe9xcFMk9vW9krziW0O9Wt0kSgL8raRpklc6
	 mDHjbe/4MtK+9sfgv9IvX7OVLiUOdt9mU+nWPzYvEhAAYPVX7FzrQ/DIqm9P69VTkLVci
	 HaHTq4LiIKKLBwtiru7c2dOLIgP2RQJ3jggduF3/ii74pYM99EcuAXaHA2bGsW/Lxp7na
	 m5QSG+bvyUNgwp1YA/dWL8MNlgjygaROO8Iken33N/mlbDi51gv6AdPmPs3C/6Jl0JwN0
	 AOk4j6BSr+viIzJ9sHTtBSa00dL9E65OFLpqi74gVpQ+NahrPORjfkk8tTLKeEU/y3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chenxiaosong.com;
	spf=pass smtp.mailfrom=chenxiaosong.com;
	dkim=pass header.d=chenxiaosong.com header.i=@chenxiaosong.com header.a=rsa-sha256 header.s=key1 header.b="a/jv6JjF";
	arc=none smtp.remote-ip=91.218.175.58
Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9F606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.a=rsa-sha256 header.s=key1 header.b=a/jv6JjF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qu6++vYIG27+XtXchHhIRccwrxsnE0Ys6DdfwHscTJ8=;
 c=simple/simple; d=chenxiaosong.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793675019; v=1; x=1794279819;
 b=a/jv6JjFukP7pl6VNlRqNcL5fHWh2BOfA9mc2iWj2mylJcEKpUpQPr0aFGKCvc9/A0i8YuEl
 Nw+7TsiuNVeFzugSrOyRT4Ljc6GtUpYmnmsoRrOxyzwh0XaVQfi4Pd4ZD64DveTdiTD0u6x60HP
 HIEXa5WeQTuhVTuRpbb2MhAT76fGcYzsQbvUU2ap7RckBmGeyo4+FBsmqvVTKyK0MyRsgtJSmov
 cbAGG8N4A07sKn798gP/IkajYircvfYhducnPf6v+E6O5BstQWWdAiApwZO0f30DMF490WZoE2T
 gkYWytPF+eTbzPandJ1TAnBOd+EWnrQtSA77htXvzNa5A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d880b7f20f2040cd;
	Tue, 03 Nov 2026 03:03:38 +0000
X-Mizu-Trace-ID: d880b7f20f2040cd
X-Migadu-Flow: FLOW_OUT
Message-ID: <c02b4586-522d-49bb-87d6-69277b45add3@chenxiaosong.com>
Date: Tue, 3 Nov 2026 11:03:31 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ksmbd: require NUL-terminated EA names
To: Yifan Zhang <yfzhang23@stu.pku.edu.cn>,
 Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org
Cc: Tom Talpey <tom@talpey.com>, Steve French <stfrench@microsoft.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <179367391951.8187.2063761250230294066@stu.pku.edu.cn>
Content-Language: en-US
From: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
In-Reply-To: <179367391951.8187.2063761250230294066@stu.pku.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Since Namjae provided some suggestions on v1, it would be better to add:

Suggested-by: Namjae Jeon <linkinjeon@kernel.org>

On 11/3/26 10:45, Yifan Zhang wrote:
> smb2_set_ea() verifies that the byte reserved for the declared EA-name
> terminator lies inside the request, but it does not verify that the byte is
> zero. With SMB debug logging enabled, the name is passed to %s and the
> diagnostic reads beyond the request allocation.
> 
> KASAN reports:
> 
>    BUG: KASAN: slab-out-of-bounds in string
>    Read of size 1
>    string
>    vsnprintf
>    _printk
>    smb2_set_ea
>    smb2_set_info
> 
> Reject an EA entry whose declared terminator byte is nonzero. Return
> -EBADMSG for the malformed buffer, and map that error to
> STATUS_EA_LIST_INCONSISTENT for both SET_INFO and CREATE.
> 
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Signed-off-by: Yifan Zhang<yfzhang23@stu.pku.edu.cn>
> ---
> Changes in v2:
> - Return -EBADMSG for the malformed EA name terminator.
> - Map -EBADMSG to STATUS_EA_LIST_INCONSISTENT in SET_INFO and CREATE.

-- 
ChenXiaoSong <chenxiaosong@chenxiaosong.com>
Chinese Homepage: https://chenxiaosong.com
English Homepage: https://chenxiaosong.com/en

