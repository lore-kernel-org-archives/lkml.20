Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971880;
	b=3rHMNQPTZX98wiRIyLpi5na73naasSSSuD4uHc0ycLG5YqlmeahCAob15fIp9GFqyOHD
	 ppbvx8Jw4w+ofDfsGuoMSj9LxnOWHfB8a/eF/EPjLOEeNBJROLk8W3RDbPnGy5EbiHE7z
	 uVswjNj7iNm7jPrhnOHVbfL6Jt+Sa8vQSWpn0uw1u5z6RAfYwRk/TfRq+VNrnouCAcLsv
	 0L8RPlJmOjRfwru2CX+YOqavh7a4bJLN62veSZXeeJbT0yG+wnHbT9uztQ8giP6ivlmVo
	 XlgrbkXcl3lMeYMKJRfltXr9kfFueH4oweXcY+h4G5HhN1oybILzby1sMWFKV9uzsPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G6DwXFsKVtS0DwVfDaHzAgdX+wZZI3a8OJ1eN4exF+E=;
	b=qp9o9zT3pAnWmqum3dLB/UhSl1iuRYtcgdqDx6kxjJ7ALIid+y9hUqk1/vNMXilj38Ik
	 O1kTN1GP7dLz1KNDJuPJd66w+YTcZfxmfQ01IsxAb8IMuJEE+wQTexwmhQpoHofbGVn9I
	 TTwZpES4ON9U6AwsvZTNvFbYYsvqzHfs7hemsLJBLVG0sCo2SkQCNzWbyh/juuWQAwG1z
	 OevZh4u+wJpeUuI1N1944rPEBv/gx8eChsdkkA8N+kHIT22mofh6FmC02LhRv/2fJd2Zh
	 YfSbi41nf4RcMbcC+NvtWgESeH9QYduAgnInKYKwKqMqloGjEKKq133bDH388tMLo2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/NyLCh4";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7136B606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7136B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/NyLCh4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so1181864eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971879; x=1794576679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6DwXFsKVtS0DwVfDaHzAgdX+wZZI3a8OJ1eN4exF+E=;
        b=S/NyLCh45koJw3aWO9oB5LHT8jb/eDRdMkihc5/fHLq87Rg8V/uWFV4LxQKaaIj6Qp
         PhXWXPSmnD3DlUYE/7htwlzCiWSlde8wBDIkKNetpQCFJKhsr9qKq7xk46cZCvm+RWNL
         jWf+b1ZdcWA+HEOouHO1wapzkqHMx+M+XfgxP82RsnmpK9euNX1SgF1vqM87wmYh9l7W
         ZTkuVwHz1V2b6nEcR/vs+ZfhJ+DiFnyKXXyka/0VE9T+XGGw5+vWaUAmyyQcZBZjcMQE
         2KQ5JoHR8Bho+Ww5Kzq0W1IKWL7rJ3kEd4VFvr8/DjMFOd5LMW1zBGeeu1tHFHANWmRL
         9FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971879; x=1794576679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6DwXFsKVtS0DwVfDaHzAgdX+wZZI3a8OJ1eN4exF+E=;
        b=Sk2lYstX8EvnWac1t6Gvqi542IScOTOrmAKm5ok/dNIBAQOgA74kyVlmYUjLWp6YG0
         P5Uzq4zhsEWBT1YpgqSYVLCUHecU1urnxInT2CYwxfjkY2QGybzqjlKwIVKQibhNSF1k
         FLo1MklNFBF9M4462GCsm5gknNF+n8pmZ7sRO85OGUEGmlRqUnFWthRmFnHbe443gt0i
         Tjk/FXIxWR5U+5wEQ0wpvZJKvfE2aXZI8z4+MT2fBF5Hu5Tbq1O8ctgiDYQFgtz78tBh
         TmzpLI+ZhBBI9n7tOk2yOMehQM+NYfGj3Vb40sfRDBg4d0222di50f6U9WTJ8vE75SSk
         Pv9w==
X-Forwarded-Encrypted: i=1; AL+hErF9sc0cj4a7gGeylYSoi4lQxOlgClT6U+KdasySMMuHjseoxsN3IFJQBrH3nzdcG+/Ueh8Ci6AfIjef5ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DPaZio+D1Isj1qLtaQ1BimmaVy+79e9/VxY0GJZ96EyKD/+P/
	xwCp/ljyKrCcJyFFNkg+k3/6Z8hTg+li9VDj8//rUB7ycG1VyjrYuB100PhZLEIshQ2KvQ==
X-Gm-Gg: AYBFou2k2+zBVG5AlPyyZZoUJTKJNFBnWsTrVkcijauZqPYd7VcOGPppG2WVZxWbsZk
	opanmWgTMFC6wDCug3VDIOW6mRz5lC8rWPcwINNfir/YDEuDU5kKRm7uB8t61NVh5irIGoeUxkE
	MbfJo1kk61GmSezOWt3RjuYdWVQLrjVeu9XeS88p/Hgrt3CkCiDQ1IEPjwTcViFk0wb8Umtfnft
	DtDnd0eGHo1i4wlln34s1AzqJvpDSb0mPJaC5eaNmVDo9V5Ypibhb9DsIV00ZMErseSktsCGrW7
	mbiUDsa0TtcxTlPvU1OoBFqbojZVEOYyJmqeNDrZdu5wQWx1tXIgmRau3HxDksuMz2P7mORkltb
	baw0XcBXs3nf0zi0v2pGlaeeYQJo6RUVe/mIEWmoULEAYWJ+ucAJgMj9un6qf+YbYgSrUzXd0YB
	iIspMux8AKJDiaoYZ67Q3GMgVyrJ4LHZ1RPrqusY1/Ct2qfNVebw+1aHtfsvrxBaEXUpu9S2f5c
	UE6c7NfJXwcfqLNq8jgDbWvn8qX/3G4pb3pFVIwwDSLWfT09mxlXdw3ZEbjo++Sv2jKN5Ka9GvP
	qpH8zfS+nYcnYeQhMNBpjiKT9YYwNbA46z5koo5BQeqlEigw16qJvx4/zE6QtYN85c+ku3qUwAI
	d8YSJHEjXRew=
X-Received: by 2002:a05:7301:4701:b0:369:f0de:259f with SMTP id 5a478bee46e88-36f76c170e7mr2928285eec.35.1793971879318;
        Fri, 06 Nov 2026 05:31:19 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm15269305eec.3.2026.11.06.05.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:31:18 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Fri,  6 Nov 2026 19:01:10 +0530
Message-ID: <20261106133110.2659482-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106124553.2617026-4-wahidzk0091@gmail.com>
References: <20261106124553.2617026-4-wahidzk0091@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Namjae,

The Sashiko review of 3/3 also suggests skipping every AT_DATA
attribute in this loop, not only the named ones. I'd keep the unnamed
case as it is, for three reasons:

- Converting the unnamed $DATA from this loop is what the loop already
  did before the patch. The patch only stops it from pairing the length
  of a named stream with the unnamed inode.

- The lock order the review points at (mrec_lock held while
  ntfs_attr_make_non_resident() locks folio 0) is the same one used by
  the direct conversion near the top of ntfs_resident_attr_resize(),
  before the loop. So it is not specific to the loop.

- When an EA or a stream grows in a full record, converting the unnamed
  $DATA is what frees the space. Skipping all of $DATA would turn those
  writes into failures.

If you'd rather drop the unnamed case from the loop too, I can send
that as a separate patch so the two changes can be judged on their own.

Thanks,
Wahid
