Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDE3FE64A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395697; cv=none; b=GgE0uD92rEuX8GxHMh5nTC5hIr2CC/YIRSWKl3QENvm0pys5dIaeevMAIemEA6khwRZJ0BYW0OG6jOPtm83e2oMUU1b71CpsZ3YBGwRZwq1dxNVTzNF8c0r1tSSLbun+EnTKX+db93el6pdw1paaG03xOnQG6nVkinYxKaARuM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395697; c=relaxed/simple;
	bh=OrftzPm6D+m9uleRC9r87PziXIIEROeKDdBIKnk/3QA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NX1BHkksdQ0vksTUqcPsb0f66PKSKGlERrww522CGbcOmvQIYY68rXX36k1ob7uD6PxnnC3opD0KVAYPZXxBM0PzBUF+sLnVo7QsobC3gxlykxW95pl5CyugkPJan84Io9RcA/NYZzbxNCu2NvnZA2WqSPOVXXC7BlaXHO1LquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83c2311eb1dso3473578a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395695; x=1793000495;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OrftzPm6D+m9uleRC9r87PziXIIEROeKDdBIKnk/3QA=;
        b=RbC7dwAwSdWoMcM8cS1LwveaAssvWzmFP81TxHXYVAyu00+hA/zffU2gDE1+GM2rjG
         y5yUiVidJedeTF/e1qOJWw9fYqx330vmdjPMxJv9Fi3LzRIdDJGZ0Duh2viomWL3WS2S
         mHwJ5OruIWOkLntmdGVpTx6FXi3NyMSTe1JUGVQtVGI285CZoNGCuUAqZePU92Ky5F/l
         igu8lDYcK/Mdd+U5QHOLlM4s/jOAXaCtdMPF/qUQPPI+qbJ2s6ODshpTTEvyjybi5WHW
         YotFzPdS2DtEGUePipQAq3H+aaaJ1JOpxYr2vISDiviKEWKq2A9khBJZERheMW4TaTbq
         g2IQ==
X-Gm-Message-State: AFq9FYI/ikodv1MqS3M/nFH9vsgPHa661prsekiFt/x14gVxbHVY2tIE
	nFoSUbOhyQflhYS3I9RU4Ya+nDtyp0bEt/igb8xB2OFxoAi73W8jPDBOxmcH7Nd9wNmxmGIpzc2
	/DhwOZWb24cgW0HUycVJYndwWFAexYNCNOKjVtCC+GtopGtlKZMnKCArlHmA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2387:b0:4e9:7d56:846f with SMTP id
 5614622812f47-53ccf00368fmr5562091b6e.41.1792395695119; Mon, 19 Oct 2026
 00:41:35 -0700 (PDT)
Date: Mon, 19 Oct 2026 00:41:35 -0700
In-Reply-To: <6a7789f3.01d0871a.3a0d52.0067.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad5c9af.a6d1a155.34a93f.0116.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [ocfs2?] KASAN: null-ptr-deref Write in fput
From: syzbot <syzbot+5d4e96acd0febccb5e87@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [ocfs2?] KASAN: null-ptr-deref Write in fput
Author: eklavyasingh2106@gmail.com

#syz test: https://github.com/eklavya072/linux.git ocfs2-hb-dev-race-v2
