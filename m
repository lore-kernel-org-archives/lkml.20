Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354009;
	b=qdIoIJFSncRPYb6sBEIUNWRjky7kLPRIHt2mPcmXj8JESUYUjZes4aMlz9VmdEQ5v/af
	 zNNzcMGbDr+TCSQ64Fn0VKlZxk2JPTFgzQ2U4cMjkJrhNsn156cgjB0rCyrORejjqLZUA
	 FF02FR90TJ5GPosscQyXN3679weDhxse5zHNBnS0P7ibbtBd9unPYYy13W8hykd1zl8Gu
	 xp+VN2AlN1ba457Raubog+OF211A/kqF5C+ELXClDvMwj3hdVvFv5Avs9X/DhjX8B44Tx
	 DHuS7/azgebDk806lsYnRfirsvmHq+p4Wb5bZZFtDtAZindn8eho4DyVHk4bQcawF9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
	b=01Zs04b80Yy2y84YVgPzeyCxGLSGHfYoU0w09Xjnf8Nv1puYhGalssOkaxGo9U6PU2BW
	 I34qtOjLa3x5IyBw/xk25fOVR2WYSJt/HhFJ3yVJrNYi3K2PdV1szhI5nUYWTqaPCNFUM
	 cknVOkLgdIT242u6TIZCLYuIVLJ6p2eSFgPRCgaeAgYMVqONQWn5k3NC4yUnexoj2E7eb
	 U6hW6w27wlWk6puMZJyyDROOpjF7XnAlXiVyFW9j46b5A6D4G0h96lb3LuhagevF+jlfE
	 IBQ0+6yLgpYSsGad6FRevS1B+UCNMKIRmtMYVAZ1QXgevQpODH+gV5UxQYMoqj7KPGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4260A2603
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F4260A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so5029385e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793353997; x=1793958797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
        b=jfCUPK9sZBoRtj2E+Alb9yXH9e9oEAKo6O5FdNMtEtjfbqrv2VRaYVXKp3gzMIsb45
         sd5OuL+bpBjiYZ5XwMFZwC4lARId+a+AiPW3kCH52zurleBtox0FUUeoLFox5UZbALIX
         iKhkw0WljBZZ7vq1pKhyJKVBXZVsAGRnFlj9YEJ71eTohu3oCRaJIaiPjZ+ONR0FrkN7
         9FWaY5PjdmumcBgOVAnQAZYOrvX2In4f41fMgf6TycYk0f0XDQq32zX+826jUXH5Tntc
         GM244THgeu1VuSeiZn0SWIzmXDYSOnmv4iLsdz10MK0iILCHIe5p/kNUpjENpypGm5IQ
         jgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353997; x=1793958797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
        b=Vb4XLeKTdIeqsOJKDItQmEN+ew1Szv4o2Wq/taMzvjkpjCN2/U17hUAFvaiZL3ZOG2
         koTGAUg5vgmG4yC0X54eCCueTH5fJwh3+JuRuXoZuCKi1LD5YxY6PUZLJGvcRFuUtuB0
         0z5KbxGj6FsEke1xXAGwzqNNwlXYIvuAq0bDTaQFC2kQrZ1plizraG7U+qQNtGWYH6ot
         z0F5x/iWObqU08mo0wWtAYE2orRh6q2Vo+dTcowEo0KesL+fRg1sZs8K5lSWjbM4LxpP
         w/sgzy4taSlXcRA2jaxio0afGZjvUwVG4+lw4Lv1T7x1+D8jMleaVVJ8iCKc7CsuDL/e
         vTuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLQcMfAa/z3bsmqmZFgrZnFzGeU1sH9g/sj5i3R6KJPIyt0w+Wwye8p0FnhDMSW7sfw2LanafVhy7HJuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIolGDmb9ihm47CcSS9ZH4Wg+XRMrFa8UUfhuP5+Z5dVvGn1WND
	/dO/ezyZhBlDSGnirPF6rEOflBoim95FFmHrkKKU5tN+gRr+NAFSBChlih149rJUmTs=
X-Gm-Gg: AYBFou0KMNj8e6IEtKsmxVRD0G7iqqUn82JYxlU+i7EmfUeuruBjhDdDWXbzA45HceD
	VXG7aiFjksK7/6KFjFyprEWOOhzRiIx/xJJQZ9uQz3DDNwG1bpSRWxtiS+ua91bzIahpCGFgV2o
	dNZsQK1haE0upHDZIsOkSU7N8Q6fGLli7DduT2C8hYA1qPiVuSBjCXsLpq1zkhssW3fvRfUX309
	IEWVlEveYN+Bwb4PKUY3C1K0WurR1F2j+/Lvjx6RiJS6tWW+OkdnzYBD8tbqR6y4OOahC2dmxFk
	9oylmcb/ZlhWhdZuGaDa5VyBjMtXxXVOZFUoVeurMXiLcFASDcKuQlqmre9hnOZQYpNWU1vPOOa
	8sUQd0da/oPnOGqY0uuiwYwS1cSzl2UkXZErJSD2F93E5PZwIRkm3Gzbb57I7im+kZw/UGyDa4u
	pZLTyLVIhMFCmrHoqQNy2QwsQpOAs3qthOXzlKDtqaUAjf22ksBPm969P7zCUwgxunsYUTIofN7
	UT4xrWfXCP5Dcqx8WH46xYJnPcUqcz4WSKv0HYrPV8gjBukDdqfj80WrB49SEeEDpG6BTKj9BCQ
	EB0tOvaZWBB60LS+0WDV/5rbAaLbXMXztXpqRASskkMsq/t2nAHgfbNjP5I=
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr37419475e9.32.1793353996568;
        Fri, 30 Oct 2026 02:53:16 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm127578065e9.4.2026.10.30.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:53:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:53:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auRmMPfaFINUIchi@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
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
In-Reply-To: <179302367452.58760.11808905856343064399.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>This isn't even that complicated, if I ask AI to explain it in a C ish
>language:
>
>struct device_get_reply {
>	struct {
>		optional struct {
>			uint min_challenge_length;
>			uint max_challenge_length;
>			uint max_total_output_length;
>			struct {
>				enum blob_class;
>				string format;
>				enum representation;
>				uint max_length;
>			} objects[];
>		} evidence;
>
>		optional struct {
>			flags mr_flags; /* read, extend */
>		} mr;
>	} caps;
>
>	struct {
>		/* device-info: filled by the derived family */
>	} info;
>};
>
>I think the yaml names are not helping, calling everything attrs
>everywhere is really confusing. At least the transition into a nest
>and an attr-set should be more clearly marked in the yaml..
>
>The yaml would be significantly better if it was layed out according
>to the actual semantic flow instead of artificially being twisted into
>this need to put everything into a linear list. AI invented this:
>
>device-get:
>  request: {}
>  reply:
>    caps:
>      evidence?:
>        min-challenge-length: uint
>        max-challenge-length: uint
>        max-total-output-length: uint
>        objects[]:
>          blob-class: evidence-blob-class
>          format: string
>          representation: evidence-representation
>          max-length: uint
>      mr?:
>        mr-flags: mr-device-caps
>    info:
>      $extend: device-info
>

I have it implemented like this (with small changes). Looks great!


>So.. how about could we drop the sets, use a direct description of the
>layout and do something else for the ID numbering? Maybe the numbering
>can be solved directly by only listing the names in:
>
>numbering:
>  - device-get.reply
>  - device-get.reply.caps
>  - device-get.caps.evidence
>  -[..]
>
>?

I'm still committed to implicit numbering. For "inline records" I
resolved it by having it encoded as a tree with 4 levels:

 63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
+-------------+-----+------------+------+------+------+------+------------------+
|   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
+-------------+-----+------------+------+------+------+------+------------------+
              |<------------------ record ------------------>|

Renamed "attr" to "field" - I agree that the original implementation had
attr everywhere. I got rid of it.
"group" is now "record". I enlarged it to 32 bits to accomodate:
1) kind is one of: named, request, reply - request and reply is used for
   inline op records,
2) index for named records (pre defined)
3) L1-L4 for inline records

rfc2 will show it in more details
>
>-- 
>Jason
