Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792853457;
	b=klTXM3TtN95yRcy204HRzg4+u78wlQe6dQq5R92rVUSois5cdANQXZm1rjqgqz/+Bcy0
	 +yEVagGxkmIYyjf5tV6b90K4ge8TUFuZUcAcZtyBoNBtC+5CC8XwEhcp7j60W1UmbIaHe
	 oNO6234Fr9R1K53UWgz9mPHKFjVAFByPHx1fMPs3NsYgyAFPIN/T5rSzY0OZ69DHmmgNH
	 Wf6Z2Ngeh7Mi27hZ9cveyJoVsVnqamlXv94ddi6lMCK7fuLiY2IAMsbmSEJHmfrORKYxq
	 yNqpLOKfXxioDH1oqAxZ4h4swY08n8dlfrYTJ6mNgNG4cLddFQHSGj/yuOxMX7iyfrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792853457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oZvBLqDPBaLg4LIS9YhIcduNjIcvPJJjPCa0HY4MKLE=;
	b=dG3QLipn+YoE6hgjwOvoSjVsWX9K5JF0MGKrT+58NND3O9L49YXswXFDn8Gt1LOCpNfO
	 EwQ7Yp19ASoe38R0HLDMjw1eW3uEjVDw9ipNUE7WF3ksCseyG6geyzgta4TnFfj8W9utu
	 KlqktGbL8E9OdUTrJBNYN8zc/4/Vi3jB5vVKfCed4m6fuktOL3FF0vkEn4754JbDFuflG
	 wu9hCH0wqRJKuma3kv690KOkUi3Z+If4VCaHUaowVpTi8sYZ81cFAgctaKeGkQD5slhR+
	 cOa0zvERTHcz60C+ad3mmP/klVfsO5iFpCRMDMic0KZtej9bl7yDzzV8TYAL7W/wcUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EiE5Zway;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF25606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF25606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EiE5Zway
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso4259155e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792853455; x=1793458255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZvBLqDPBaLg4LIS9YhIcduNjIcvPJJjPCa0HY4MKLE=;
        b=EiE5Zwayw2W22SXHx42W0RXZlGb6r7sjWOv/o+rsquZsbY8aCDqwo/fR4qozhHng4s
         emyFdZzmiMpLbf3tKvnHxNEimKUlxMKwoWkAtneaZlWk/HlxPaN8iSfvEcobvL8M2ASE
         E4QDl00GMUNaQjJsF9GHuhTFiBnvF0jvDG4xLuLE7F5tumcwOkrniRB7xQzZixvh/m4+
         MrfYdGetNJ/M7fNtqDjV3ILzx7ILvnuuTqIAaCv4IFRvrbGefvuYHSzuEGx9/9XMqM1A
         P6nOHw8FmRNyOb6sKh8Nyr1TJ+xX75umDDw6+/EiT7uv1z1Ie4yyH+tO9GtxrwbzwwE4
         C5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792853455; x=1793458255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZvBLqDPBaLg4LIS9YhIcduNjIcvPJJjPCa0HY4MKLE=;
        b=YXXQs7WjZ+t3OJDcBHshaZsxWUTJc0TbCv3KibWe0/2XQ3QxVMYBLi6hT0R845hpre
         NsomSPRA3GeKWfuXx8MHjWVu1MgrvnjFG0yNScbzTIbRYFivNIJLy6zvdZsvKRyaKDHe
         Px8tiqqOSh6Ca3AhHNAl7l7M/zjcTiBsSGkwNT8skW5XKKzGi1/8aMx4WxLSjGLBTB79
         ovrNtWHIM9XhJyhvnenQ+rQMin6pWGLfa/r+XnBdiwJB2vVM0V890IDKhlfq6oQ2Mi78
         1wjcOF3IhxqLQwDRQ8R8OZYvOLsJcGbMrUbeOrPhoaYeoFO3CjbV30jUN7gDRcfxR3LD
         Y+kg==
X-Forwarded-Encrypted: i=1; AKwUvBySQ4wGQMhIe6Py62KNwL9RiA5E71lhKD8tE78ePGfPcryQzH7lp5HGAUzNAvjjwqzzzYelsTvQD0p4Atg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoOXhfauSZxfG96WEUQtuX0KwwvTVXlTRC36Xp/C5UAQiw13n9
	NQw1ce6Yg76xth4hZqib8DGGKYbWGPH+t+kfmktM40DBFhoLOie16aOa
X-Gm-Gg: AYBFou3eN4nnE+dW3Gei5OSXjRBpv2/IiOkqnLQXqA0iFSBBUpH9jmYy+AJsoaxPTGR
	VruEl9nKhCQqmGIntWKkJy/rIRIQQHw8GD7taSE4r3vC9Qr6UoIKS9XhAyUxhZo43VeQHsYE8OU
	RJxPbF6Vjz8Y5pyDWVm+OhQydYiKUoAl3vPer7dkl1TPP9PauyZhr0PuTJ93z2fl655zfFIU7ef
	ES+PXbKWm/LwUSfLxe34CErumj9R7XImcgixJK49q+heu8M+ytX8gWrwiRzBIf8z2z3NXkNg2jj
	Eq1lgJH5J6n+sJB2QoCnzp8WRIW/h7qItYKPdyxdBnzmzxnmyFjW9+/soa94VmOn9ReIMHZytXs
	orNCDlEffdihCU7RNFjdklD9p1RSs6utXEA5tWrNN1HZoxo+SwF1tAUvhNAb3KEf5A2xgTHna9F
	mfDLBkvj/k+4rSHgkC1BIRoQ3PdDef4eQhemEJdEGXMAZ4jOlMKqGV2XzFTaErX4oiQtJz4hKxQ
	0hbmP3Ggijxls7x04+Sr2e3fGS363L9/7fDNAwtBPXjnoWhNyINUBlI/MZOpjSyVMWY14QHDcTr
	5fjTMJoWk1F8XM80/LZ9QWAmQuf8R9ST9+984fiYGvd7orx+nOzkhGHV7sFujZ6nPs15Uyg1GqK
	T/6HYZQNgdyJORIQcCLSG3uMry8jSfg==
X-Received: by 2002:a05:600c:83c7:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a35ac39cedmr33349865e9.3.1792853455477;
        Sat, 24 Oct 2026 07:50:55 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm4424438f8f.3.2026.10.24.07.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:50:53 -0700 (PDT)
Message-ID: <b3c2571d-9b20-4f6e-96b6-f3c066af30e2@gmail.com>
Date: Sat, 24 Oct 2026 15:50:51 +0100
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
Subject: Re: [PATCH net v2] tcp: reject devmem tx with fastopen and repair
To: Mina Almasry <almasrymina@google.com>
Cc: Kaifeng Wang <kaifengw@google.com>, netdev@vger.kernel.org,
 edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, kaiyuanz@google.com, sdf@fomichev.me,
 linux-kernel@vger.kernel.org
References: <20261019174522.55644-1-kaifengw@google.com>
 <4d5e00b9-5081-4530-ade5-41570e4a5b2f@gmail.com>
 <CAHS8izN72w--+5pxxzg44eCOdaeYcJUpXSeJUoqEdZRRq7xPXg@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izN72w--+5pxxzg44eCOdaeYcJUpXSeJUoqEdZRRq7xPXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/26 18:15, Mina Almasry wrote:
> On Wed, Oct 21, 2026 at 8:17 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
...>>> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
>>> index 87ef6d5cbfeb..2792923f0748 100644
>>> --- a/net/ipv4/tcp.c
>>> +++ b/net/ipv4/tcp.c
>>> @@ -1169,14 +1169,18 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>>>                        zc = MSG_SPLICE_PAGES;
>>>        }
>>>
>>> -     if (!sockc_err && sockc.dmabuf_id && (zc != MSG_ZEROCOPY || !binding)) {
>>> -             err = -EINVAL;
>>> +     if (sockc.dmabuf_id && (zc != MSG_ZEROCOPY || !binding)) {
>>
>> I wonder why it does sockc_err checks like that for devmem, e.g. instead of
>> failing earlier. Maybe Mina remembers?
> 
> IIRC, Paolo caught an issue where we were subtely changing behavior.
> Like if someone passes in a bad sockc flags, it's usually ignored, but
> if we process the sockc_err before we need it for devmem we change
> behavior for existing users that were passing bad sockc but not using
> devmem.

Got the idea, thanks. Sounds like this chunk can potentially change
it in the same way, though I'd need to look up that thread with
Paolo to be sure.

-- 
Pavel Begunkov

